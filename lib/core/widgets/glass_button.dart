import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/glass.dart';
import 'glass_surface.dart';

/// A single-purpose call-to-action button.
///
/// [filled] (the default) is a solid accent pill with a white label;
/// disabled (`onPressed == null`) dims the accent to alpha 0.4. When
/// [filled] is false it renders as a [GlassSurface] outline with an accent
/// label instead.
class GlassButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  const GlassButton({
    super.key,
    required this.label,
    this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    final accent = OzColors.accent.resolveFrom(context);
    final disabled = onPressed == null;
    final labelColor = disabled ? accent.withValues(alpha: 0.4) : accent;

    if (filled) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: labelColor,
            borderRadius: BorderRadius.circular(OzDims.radius),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        child: GlassSurface(
          level: GlassLevel.surface,
          radius: OzDims.radius,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: labelColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
