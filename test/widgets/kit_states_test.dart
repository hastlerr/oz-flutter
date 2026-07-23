import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/widgets/empty_state.dart';
import 'package:oz_flutter/core/widgets/error_retry.dart';
import 'package:oz_flutter/core/widgets/shimmer_card.dart';

void main() {
  group('EmptyState', () {
    testWidgets('renders title, subtitle, and action', (t) async {
      await t.pumpWidget(CupertinoApp(
        home: EmptyState(
          icon: CupertinoIcons.search,
          title: 'Ничего не найдено',
          subtitle: 'Попробуйте изменить фильтры',
          action: CupertinoButton(onPressed: () {}, child: const Text('Сбросить')),
        ),
      ));

      expect(find.byIcon(CupertinoIcons.search), findsOneWidget);
      expect(find.text('Ничего не найдено'), findsOneWidget);
      expect(find.text('Попробуйте изменить фильтры'), findsOneWidget);
      expect(find.text('Сбросить'), findsOneWidget);
    });

    testWidgets('renders without subtitle/action when omitted', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: EmptyState(icon: CupertinoIcons.search, title: 'Пусто'),
      ));

      expect(find.text('Пусто'), findsOneWidget);
    });
  });

  group('ErrorRetry', () {
    testWidgets('fires onRetry when the retry button is tapped', (t) async {
      var retried = false;
      await t.pumpWidget(CupertinoApp(
        home: ErrorRetry(error: Exception('boom'), onRetry: () => retried = true),
      ));

      expect(find.text('Не удалось загрузить'), findsOneWidget);
      await t.tap(find.text('Повторить'));
      await t.pump();

      expect(retried, isTrue);
    });
  });

  group('ShimmerCard', () {
    testWidgets('renders at the given height', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: Center(child: ShimmerCard(height: 180)),
      ));
      await t.pump();

      final container = t.widget<Container>(find.byType(Container));
      expect(container.constraints, const BoxConstraints.tightFor(height: 180));
    });

    testWidgets('renders at default height when unspecified', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: Center(child: ShimmerCard()),
      ));
      await t.pump();

      expect(find.byType(ShimmerCard), findsOneWidget);
    });
  });
}
