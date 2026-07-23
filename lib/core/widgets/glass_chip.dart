import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/glass.dart';
import 'glass_surface.dart';

/// A tappable filter pill. Selected state tints accent color both in the
/// label and via a faint accent overlay behind it.
class GlassChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const GlassChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = OzColors.accent.resolveFrom(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: GlassSurface(
        level: GlassLevel.overlay,
        radius: 999,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: selected ? accent.withValues(alpha: 0.14) : null,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected ? accent : OzColors.ink.resolveFrom(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
