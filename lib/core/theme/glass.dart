import 'package:flutter/cupertino.dart';

enum GlassLevel { chrome, surface, overlay }

class GlassSpec {
  final double blur;
  final double tint;
  final double borderOpacity;
  const GlassSpec(this.blur, this.tint, this.borderOpacity);
}

abstract final class GlassTokens {
  static const specs = {
    GlassLevel.chrome: GlassSpec(28, 0.55, 0.28),
    GlassLevel.surface: GlassSpec(18, 0.42, 0.18),
    GlassLevel.overlay: GlassSpec(10, 0.30, 0.12),
  };
  static Color tintColor(BuildContext c, GlassLevel l) {
    final b = CupertinoTheme.brightnessOf(c);
    final base = b == Brightness.dark ? const Color(0xFF1A1E1B) : const Color(0xFFFFFFFF);
    return base.withValues(alpha: specs[l]!.tint);
  }
}
