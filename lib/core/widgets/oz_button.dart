import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import 'oz_surface.dart';

/// A single-purpose call-to-action button.
///
/// [filled] (the default) is a solid accent pill with a white label;
/// disabled (`onPressed == null`) dims the accent to alpha 0.4. When
/// [filled] is false it renders as a bordered [OzSurface] outline with an
/// accent label instead — no glass.
class OzButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  const OzButton({
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

    final Widget content = filled
        ? Container(
            height: OzDims.buttonHeight,
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
          )
        : SizedBox(
            height: OzDims.buttonHeight,
            child: OzSurface(
              radius: OzDims.radius,
              bordered: true,
              shadowed: false,
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
          );

    return Semantics(
      button: true,
      enabled: !disabled,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: ExcludeSemantics(child: content),
      ),
    );
  }
}
