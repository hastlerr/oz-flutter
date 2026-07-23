import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/glass.dart';
import 'glass_surface.dart';

/// Shows a bottom sheet in glass chrome, sized to [heightFactor] of the
/// screen, with a grabber handle above [child].
Future<T?> showGlassSheet<T>(
  BuildContext context, {
  required Widget child,
  double heightFactor = 0.7,
}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => FractionallySizedBox(
      heightFactor: heightFactor,
      child: GlassSurface(
        level: GlassLevel.chrome,
        radius: OzDims.radiusL,
        child: SafeArea(
          top: false,
          child: Column(children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color:
                    OzColors.inkSoft.resolveFrom(context).withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: child),
          ]),
        ),
      ),
    ),
  );
}
