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
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutBack,
                    margin: EdgeInsets.symmetric(
                      horizontal: i == index ? 6 : 12,
                      vertical: i == index ? 8 : 14,
                    ),
                    decoration: BoxDecoration(
                      color: i == index ? accent.withValues(alpha: 0.16) : null,
                      borderRadius: BorderRadius.circular(OzDims.radiusL),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[i].icon,
                          size: 22,
                          color: i == index
                              ? accent
                              : OzColors.inkSoft.resolveFrom(context),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          items[i].label,
                          style: TextStyle(
                            fontSize: 10,
                            color: i == index
                                ? accent
                                : OzColors.inkSoft.resolveFrom(context),
                          ),
                        ),
                      ],
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
