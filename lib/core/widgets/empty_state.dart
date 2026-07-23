import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/typography.dart';

/// Centered placeholder for empty lists/screens: an icon, a title, an
/// optional subtitle, and an optional action (e.g. a button).
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 56, color: OzColors.inkSoft.resolveFrom(context)),
              const SizedBox(height: 16),
              Text(title, style: OzText.title(context), textAlign: TextAlign.center),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(subtitle!, style: OzText.caption(context), textAlign: TextAlign.center),
              ],
              if (action != null) ...[
                const SizedBox(height: 20),
                action!,
              ],
            ],
          ),
        ),
      );
}
