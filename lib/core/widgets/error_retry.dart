import 'package:flutter/cupertino.dart';

import 'empty_state.dart';
import 'oz_button.dart';

/// Standard "load failed" state: icon, message, and a retry button wired to
/// [onRetry].
class ErrorRetry extends StatelessWidget {
  /// Intentionally not rendered anywhere in [build] — surfacing raw
  /// exception text/types to end users is not useful copy. Kept on the
  /// widget so callers can still log it (e.g. to crash reporting) alongside
  /// showing this generic state.
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
          child: OzButton(label: 'Повторить', onPressed: onRetry),
        ),
      );
}
