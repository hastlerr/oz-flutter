import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';

/// Page shell: paper background with a soft accent glow, hosting an optional
/// [navBar] on top, [body] in the middle, and a floating [tabBar] at the
/// bottom.
class GlassScaffold extends StatelessWidget {
  final Widget body;
  final Widget? tabBar;
  final Widget? navBar;
  const GlassScaffold({
    super.key,
    required this.body,
    this.tabBar,
    this.navBar,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CupertinoTheme.brightnessOf(context) == Brightness.dark;
    return CupertinoPageScaffold(
      backgroundColor: OzColors.paper.resolveFrom(context),
      child: Stack(children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.9, -1.2),
                radius: 1.4,
                colors: [
                  OzColors.accent
                      .resolveFrom(context)
                      .withValues(alpha: dark ? 0.18 : 0.10),
                  OzColors.paper.resolveFrom(context),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Column(children: [
            ?navBar,
            Expanded(child: body),
          ]),
        ),
        if (tabBar != null) Align(alignment: Alignment.bottomCenter, child: tabBar!),
      ]),
    );
  }
}
