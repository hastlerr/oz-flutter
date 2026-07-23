import 'package:flutter/cupertino.dart';

import 'empty_state.dart';
import 'glass_button.dart';

/// Standard "load failed" state: icon, message, and a retry button wired to
/// [onRetry].
class ErrorRetry extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;
  const ErrorRetry({super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) => EmptyState(
        icon: CupertinoIcons.wifi_exclamationmark,
        title: 'Не удалось загрузить',
        subtitle: 'Проверьте соединение и попробуйте ещё раз',
        action: SizedBox(
          width: 180,
          child: GlassButton(label: 'Повторить', onPressed: onRetry),
        ),
      );
}
