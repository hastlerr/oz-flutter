import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';

/// Page shell: warm paper background with a soft accent glow, hosting an
/// optional [navBar] and floating [tabBar] over [body].
///
/// ### Bottom/top inset convention
///
/// [navBar] and [tabBar] are painted in a [Stack] on top of [body], not laid
/// out alongside it — this lets [body] scroll underneath both (the nav bar's
/// glass-on-scroll effect needs content passing behind it, and the tab bar
/// needs to float over the feed rather than push it up). To keep that content
/// from actually being *hidden* behind either bar, this widget wraps [body]
/// in a [MediaQuery] override that pads `MediaQuery.paddingOf(context)` with
/// the bars' reserved space:
///
/// * bottom padding gains `OzDims.tabBarHeight + 10` when [tabBar] is set;
/// * top padding gains a fixed ~64pt nav-bar budget when [navBar] is set
///   (a fixed budget rather than measuring the real nav bar subtree — simple,
///   and the bar's content is a fixed single-line title row so it doesn't
///   vary enough to need a `LayoutBuilder`).
///
/// Any [body] built the normal way — a `ListView`/`CustomScrollView` with no
/// explicit `padding`, or content wrapped in `SafeArea` — automatically picks
/// this up (that's how `MediaQuery.paddingOf` propagates) and clears both
/// bars without the caller hard-coding bar heights itself.
class OzScaffold extends StatelessWidget {
  final Widget body;
  final Widget? tabBar;
  final Widget? navBar;
  const OzScaffold({
    super.key,
    required this.body,
    this.tabBar,
    this.navBar,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CupertinoTheme.brightnessOf(context) == Brightness.dark;
    final mq = MediaQuery.of(context);
    final bottomInset = tabBar == null
        ? mq.padding.bottom
        : mq.padding.bottom + OzDims.tabBarHeight + 10;
    final topInset = navBar == null ? mq.padding.top : mq.padding.top + 64;

    return CupertinoPageScaffold(
      backgroundColor: OzColors.paper.resolveFrom(context),
      child: Stack(children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              // Warm minimalism: content is the hero, so this glow is barely
              // there — just enough to keep the paper background from
              // feeling flat, toned well down from the earlier glass-forward
              // look (was 0.10/0.18 light/dark).
              gradient: RadialGradient(
                center: const Alignment(0.9, -1.2),
                radius: 1.4,
                colors: [
                  OzColors.accent
                      .resolveFrom(context)
                      .withValues(alpha: dark ? 0.10 : 0.05),
                  OzColors.paper.resolveFrom(context),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: MediaQuery(
            data: mq.copyWith(
              padding: mq.padding.copyWith(top: topInset, bottom: bottomInset),
            ),
            child: body,
          ),
        ),
        if (navBar != null) Align(alignment: Alignment.topCenter, child: navBar!),
        if (tabBar != null) Align(alignment: Alignment.bottomCenter, child: tabBar!),
      ]),
    );
  }
}
