import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import 'oz_surface.dart';

/// A tappable filter pill. Selected state fills solid accent-tint (no
/// border); unselected is a bordered [OzSurface] pill with an ink label.
class OzChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const OzChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = OzColors.accent.resolveFrom(context);
    final pill = OzSurface(
      radius: 999,
      bordered: !selected,
      shadowed: false,
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
    );

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        // The pill's own visible padding is shorter than a comfortable tap
        // target — this keeps the rendered pill unchanged while padding out
        // the *hit area* to Apple HIG's ~44pt minimum.
        child: ExcludeSemantics(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 44),
            child: Center(child: pill),
          ),
        ),
      ),
    );
  }
}
