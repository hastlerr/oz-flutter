import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import '../theme/dims.dart';
import '../theme/glass.dart';
import 'oz_glass_layer.dart';

/// The single glass primitive. Every kit component wraps content in this.
///
/// Standalone (no ancestor [OzGlassLayer]) this is zero-config: it creates
/// its own layer/backdrop, exactly as before. Nested under an [OzGlassLayer]
/// whose [OzGlassLayer.level] matches [level] exactly, it instead registers
/// with that shared layer — see [OzGlassLayer] for why (many individual
/// per-card layers don't scale to a feed).
class GlassSurface extends StatelessWidget {
  final GlassLevel level;
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry padding;
  const GlassSurface({
    super.key,
    required this.level,
    required this.child,
    this.radius,
    this.padding = EdgeInsets.zero,
  });

  /// True on platforms where the real liquid-glass shader effect (Impeller)
  /// is expected to be available. Uses [defaultTargetPlatform] rather than
  /// `dart:io`'s `Platform` so this is overridable/testable from Flutter
  /// tests (the test VM otherwise reports the host OS, not iOS) — guarded
  /// with `!kIsWeb` since `defaultTargetPlatform` on web reports the host
  /// platform it's embedded in (which could itself read as iOS on an iPad
  /// browser), and the shader path is native-only regardless.
  static bool get _liquid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    final spec = GlassTokens.specs[level]!;
    final r = radius ?? OzDims.radius;
    final tint = GlassTokens.tintColor(context, level);
    final content = Padding(padding: padding, child: child);

    final ancestor = OzGlassLayer.of(context);
    final shared = ancestor != null && ancestor.level == level;

    if (_liquid) {
      if (shared) {
        // The ancestor OzGlassLayer already pinned full LiquidGlassSettings
        // (including glassColor) for this level — just register this shape
        // with it instead of paying for another layer.
        return LiquidGlass(
          shape: LiquidRoundedSuperellipse(borderRadius: r),
          child: content,
        );
      }
      return LiquidGlass.withOwnLayer(
        shape: LiquidRoundedSuperellipse(borderRadius: r),
        settings: LiquidGlassSettings(
          blur: spec.blur,
          glassColor: tint,
          thickness: spec.thickness,
          lightIntensity: spec.lightIntensity,
          saturation: spec.saturation,
          refractiveIndex: GlassTokens.refractiveIndex,
          chromaticAberration: GlassTokens.chromaticAberration,
          lightAngle: GlassTokens.lightAngle,
        ),
        child: content,
      );
    }

    final blurFilter = ImageFilter.blur(sigmaX: spec.blur, sigmaY: spec.blur);
    final decorated = DecoratedBox(
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(r),
        border: Border.all(
          color: const Color(0xFFFFFFFF).withValues(alpha: spec.borderOpacity),
          width: 0.5,
        ),
      ),
      child: content,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(r),
      child: shared
          // Shares the ancestor OzGlassLayer's BackdropGroup capture instead
          // of taking its own.
          ? BackdropFilter.grouped(filter: blurFilter, child: decorated)
          : BackdropFilter(filter: blurFilter, child: decorated),
    );
  }
}
