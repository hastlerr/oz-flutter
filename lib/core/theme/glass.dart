import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

enum GlassLevel { chrome, surface, overlay }

class GlassSpec {
  /// Backdrop blur radius. Used by both the real shader (`LiquidGlassSettings.blur`)
  /// and the fallback (`ImageFilter.blur`).
  final double blur;

  /// Alpha of the tint color painted over/into the glass. Used by both paths.
  final double tintOpacity;

  /// Alpha of the 0.5pt white rim drawn around the fallback surface.
  ///
  /// Fallback-only: `LiquidRoundedSuperellipse`/`LiquidShape` carry a `side`
  /// (`BorderSide`) field inherited from `OutlinedBorder`, but the real
  /// shader-based glass renderer (`RenderLiquidGlass`/`RenderLiquidGlassLayer`
  /// in liquid_glass_renderer 0.2.0-dev.4) never reads or paints `side` — only
  /// `shape.getOuterPath`/`getInnerPath` are used, for clipping and geometry.
  /// So on iOS there is no equivalent rim; the shader's own specular highlight
  /// (`lightIntensity`/`lightAngle`) is what reads as an edge there instead.
  final double borderOpacity;

  /// Shader-only: `LiquidGlassSettings.thickness`. No effect on the fallback
  /// (plain `ImageFilter.blur` has no refraction/thickness concept).
  final double thickness;

  /// Shader-only: `LiquidGlassSettings.lightIntensity`.
  final double lightIntensity;

  /// Shader-only: `LiquidGlassSettings.saturation`.
  final double saturation;

  const GlassSpec({
    required this.blur,
    required this.tintOpacity,
    required this.borderOpacity,
    required this.thickness,
    required this.lightIntensity,
    required this.saturation,
  });
}

abstract final class GlassTokens {
  /// Shader inputs that don't vary per [GlassLevel] — pinned once here,
  /// at today's liquid_glass_renderer `LiquidGlassSettings` constructor
  /// defaults, for the same reason the per-level [GlassSpec] fields are
  /// pinned: leaving them to the package's defaults would mean a version
  /// bump could silently change refraction/fringing/highlight direction.
  static const refractiveIndex = 1.2;
  static const chromaticAberration = 0.01;
  static const lightAngle = 0.5 * math.pi;

  /// Every visual field of `LiquidGlassSettings` is pinned, either per level
  /// via [GlassSpec] (see above) or once for all levels via
  /// [refractiveIndex]/[chromaticAberration]/[lightAngle]. `visibility` is
  /// the one field intentionally left at its package default (1.0): it's
  /// just an on/off multiplier over every other field (see
  /// `LiquidGlassSettings.effective*` getters), not a visual choice of its
  /// own, so there's nothing to pin.
  static const specs = {
    GlassLevel.chrome: GlassSpec(
      blur: 28,
      tintOpacity: 0.55,
      borderOpacity: 0.28,
      thickness: 24,
      lightIntensity: 0.6,
      saturation: 1.4,
    ),
    GlassLevel.surface: GlassSpec(
      blur: 18,
      tintOpacity: 0.42,
      borderOpacity: 0.18,
      thickness: 16,
      lightIntensity: 0.5,
      saturation: 1.25,
    ),
    GlassLevel.overlay: GlassSpec(
      blur: 10,
      tintOpacity: 0.30,
      borderOpacity: 0.12,
      thickness: 10,
      lightIntensity: 0.4,
      saturation: 1.1,
    ),
  };

  static Color tintColor(BuildContext c, GlassLevel l) {
    final b = CupertinoTheme.brightnessOf(c);
    final base = b == Brightness.dark
        ? const Color(0xFF1A1E1B)
        : const Color(0xFFFFFFFF);
    return base.withValues(alpha: specs[l]!.tintOpacity);
  }
}
