import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import 'oz_surface.dart';

/// Shows a bottom sheet in a solid opaque surface (warm minimalism — no
/// translucency outside the chrome bars), sized to [heightFactor] of the
/// screen, with a grabber handle above [child].
Future<T?> showOzSheet<T>(
  BuildContext context, {
  required Widget child,
  double heightFactor = 0.7,
}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => FractionallySizedBox(
      heightFactor: heightFactor,
      // OzSurface only exposes a single uniform `radius` (it doesn't support
      // asymmetric corners) — round only the top corners one level up
      // instead, over an otherwise square (radius: 0) OzSurface. No shadow:
      // it would just be clipped away by this same ClipRRect anyway.
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(OzDims.radiusL),
        ),
        child: OzSurface(
          radius: 0,
          shadowed: false,
          child: SafeArea(
            top: false,
            child: AnimatedPadding(
              // showCupertinoModalPopup doesn't inset for the keyboard on
              // its own — this keeps a future text field in [child] from
              // being covered when it appears.
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Column(children: [
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: OzColors.inkSoft
                        .resolveFrom(context)
                        .withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(child: child),
              ]),
            ),
          ),
        ),
      ),
    ),
  );
}
