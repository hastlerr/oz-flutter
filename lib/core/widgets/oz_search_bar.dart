import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/typography.dart';
import 'oz_surface.dart';

/// A pill-shaped search field. When [enabled] is false it renders as static
/// placeholder text instead of an editable field, so [onTap] can be used to
/// tap through to a dedicated search screen.
class OzSearchBar extends StatelessWidget {
  final String placeholder;
  final ValueChanged<String>? onSubmitted;

  /// Only meaningful when [enabled] is false: since there's no editable
  /// field to focus in that mode, [onTap] is how callers wire up "tap this
  /// static bar to navigate to a real search screen" instead.
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool enabled;
  const OzSearchBar({
    super.key,
    this.placeholder = 'Поиск',
    this.onSubmitted,
    this.onTap,
    this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final inkSoft = OzColors.inkSoft.resolveFrom(context);
    final content = Row(children: [
      Icon(CupertinoIcons.search, size: 20, color: inkSoft),
      const SizedBox(width: 8),
      Expanded(
        child: enabled
            ? CupertinoTextField.borderless(
                controller: controller,
                placeholder: placeholder,
                onSubmitted: onSubmitted,
                style: OzText.body(context),
                placeholderStyle: TextStyle(color: inkSoft, fontSize: 16),
                padding: EdgeInsets.zero,
              )
            : Text(placeholder, style: TextStyle(color: inkSoft, fontSize: 16)),
      ),
    ]);

    final bar = SizedBox(
      height: OzDims.searchBarHeight,
      child: OzSurface(
        radius: 999,
        bordered: true,
        shadowed: false,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Align(alignment: Alignment.centerLeft, child: content),
      ),
    );

    if (onTap == null) return bar;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: bar,
    );
  }
}
