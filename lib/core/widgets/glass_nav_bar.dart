import 'package:flutter/cupertino.dart';

import '../theme/glass.dart';
import '../theme/typography.dart';
import 'glass_surface.dart';

/// Top nav bar that animates between a plain (transparent) look and a
/// [GlassSurface] chrome look, driven by [showGlass] (e.g. toggled on scroll).
class GlassNavBar extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final bool showGlass;
  final Widget? leading;
  const GlassNavBar({
    super.key,
    required this.title,
    this.trailing,
    this.leading,
    this.showGlass = false,
  });

  @override
  Widget build(BuildContext context) {
    final bar = SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(children: [
          if (leading != null) ...[leading!, const SizedBox(width: 8)],
          Expanded(
            child: Text(title, style: OzText.largeTitle(context), maxLines: 1),
          ),
          ?trailing,
        ]),
      ),
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: showGlass
          ? GlassSurface(
              key: const ValueKey('g'),
              level: GlassLevel.chrome,
              radius: 0,
              child: bar,
            )
          : ColoredBox(
              key: const ValueKey('p'),
              color: const Color(0x00000000),
              child: bar,
            ),
    );
  }
}
