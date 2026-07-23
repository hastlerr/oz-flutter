import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import '../theme/dims.dart';
import '../theme/glass.dart';

/// The single glass primitive. Every kit component wraps content in this.
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
  /// tests (the test VM otherwise reports the host OS, not iOS).
  static bool get _liquid => defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    final spec = GlassTokens.specs[level]!;
    final r = radius ?? OzDims.radius;
    final tint = GlassTokens.tintColor(context, level);
    final content = Padding(padding: padding, child: child);

    if (_liquid) {
      return LiquidGlass.withOwnLayer(
        shape: LiquidRoundedSuperellipse(borderRadius: r),
        settings: LiquidGlassSettings(blur: spec.blur, glassColor: tint),
        child: content,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: spec.blur, sigmaY: spec.blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(r),
            border: Border.all(
              color: const Color(0xFFFFFFFF).withValues(alpha: spec.borderOpacity),
              width: 0.5,
            ),
          ),
          child: content,
        ),
      ),
    );
  }
}
