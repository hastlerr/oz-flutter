import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/glass.dart';
import 'glass_surface.dart';

/// A single destination in a [GlassTabBar].
class GlassTabItem {
  final IconData icon;
  final String label;
  const GlassTabItem(this.icon, this.label);
}

/// Floating glass tab bar for the app's primary navigation.
class GlassTabBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  final List<GlassTabItem> items;
  const GlassTabBar({
    super.key,
    required this.index,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final accent = OzColors.accent.resolveFrom(context);
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: GlassSurface(
        level: GlassLevel.chrome,
        radius: OzDims.radiusL,
        child: SizedBox(
          height: OzDims.tabBarHeight,
          child: Row(children: [
            for (var i = 0; i < items.length; i++)
              Expanded(
                child: Semantics(
                  button: true,
                  selected: i == index,
                  label: items[i].label,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onTap(i),
                    // The icon/label below are purely decorative once the
                    // Semantics wrapper above supplies button/selected/label
                    // — without this, the Text's own auto-generated
                    // semantics label would merge with (duplicate) the
                    // explicit one, while the GestureDetector's own tap
                    // action (outside this) still merges up normally.
                    child: ExcludeSemantics(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutBack,
                        // Tighter than the previous 8/14pt vertical margins:
                        // with 5 real-world-length labels at phone width
                        // (~78pt/cell) that budget left too little room for
                        // icon + gap + label and overflowed (see the fit
                        // test below). The other half of the fix is the
                        // FittedBox/maxLines combo on the label itself.
                        margin: EdgeInsets.symmetric(
                          horizontal: i == index ? 6 : 12,
                          vertical: i == index ? 6 : 10,
                        ),
                        decoration: BoxDecoration(
                          color: i == index
                              ? accent.withValues(alpha: 0.16)
                              : null,
                          borderRadius: BorderRadius.circular(OzDims.radiusL),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              items[i].icon,
                              size: 20,
                              color: i == index
                                  ? accent
                                  : OzColors.inkSoft.resolveFrom(context),
                            ),
                            const SizedBox(height: 2),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: FittedBox(
                                // Shrinks the label instead of letting it
                                // wrap to a second line or overflow the
                                // cell — the Text below still reports a
                                // single-line intrinsic width (maxLines: 1)
                                // for FittedBox to scale down from.
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  items[i].label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: i == index
                                        ? accent
                                        : OzColors.inkSoft.resolveFrom(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
