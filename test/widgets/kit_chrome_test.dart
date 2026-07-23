import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/colors.dart';
import 'package:oz_flutter/core/widgets/glass_nav_bar.dart';
import 'package:oz_flutter/core/widgets/glass_scaffold.dart';
import 'package:oz_flutter/core/widgets/glass_surface.dart';
import 'package:oz_flutter/core/widgets/glass_tab_bar.dart';

void main() {
  const items = [
    GlassTabItem(CupertinoIcons.house_fill, 'Главная'),
    GlassTabItem(CupertinoIcons.search, 'Поиск'),
    GlassTabItem(CupertinoIcons.heart, 'Избранное'),
  ];

  Color iconColorFor(WidgetTester tester, String label) {
    final gesture = tester.widget<GestureDetector>(find.ancestor(
      of: find.text(label),
      matching: find.byType(GestureDetector),
    ));
    final icon = tester.widget<Icon>(find.descendant(
      of: find.byWidget(gesture),
      matching: find.byType(Icon),
    ));
    return icon.color!;
  }

  group('GlassTabBar', () {
    testWidgets('reports tapped index via onTap', (t) async {
      int? tapped;
      await t.pumpWidget(CupertinoApp(
        home: GlassTabBar(index: 0, items: items, onTap: (i) => tapped = i),
      ));
      await t.pumpAndSettle();

      await t.tap(find.text('Поиск'));
      await t.pump();

      expect(tapped, 1);
    });

    testWidgets('active item styling switches with index', (t) async {
      await t.pumpWidget(CupertinoApp(
        home: GlassTabBar(index: 0, items: items, onTap: (_) {}),
      ));
      await t.pumpAndSettle();

      final accent =
          OzColors.accent.resolveFrom(t.element(find.byType(GlassTabBar)));

      expect(iconColorFor(t, 'Главная'), accent);
      expect(iconColorFor(t, 'Поиск'), isNot(accent));

      await t.pumpWidget(CupertinoApp(
        home: GlassTabBar(index: 1, items: items, onTap: (_) {}),
      ));
      await t.pumpAndSettle();

      expect(iconColorFor(t, 'Поиск'), accent);
      expect(iconColorFor(t, 'Главная'), isNot(accent));
    });
  });

  group('GlassScaffold', () {
    testWidgets('hosts body and tabBar', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassScaffold(
          body: Center(child: Text('BODY')),
          tabBar: Text('TABBAR'),
        ),
      ));

      expect(find.text('BODY'), findsOneWidget);
      expect(find.text('TABBAR'), findsOneWidget);
    });

    testWidgets('hosts navBar above body', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassScaffold(
          navBar: Text('NAVBAR'),
          body: Center(child: Text('BODY')),
        ),
      ));

      expect(find.text('NAVBAR'), findsOneWidget);
      expect(find.text('BODY'), findsOneWidget);
    });
  });

  group('GlassNavBar', () {
    testWidgets('no GlassSurface when showGlass is false', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassNavBar(title: 'Заголовок', showGlass: false),
      ));
      await t.pumpAndSettle();

      expect(find.byType(GlassSurface), findsNothing);
      expect(find.text('Заголовок'), findsOneWidget);
    });

    testWidgets('shows GlassSurface when showGlass is true', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassNavBar(title: 'Заголовок', showGlass: true),
      ));
      await t.pumpAndSettle();

      expect(find.byType(GlassSurface), findsOneWidget);
      expect(find.text('Заголовок'), findsOneWidget);
    });

    testWidgets('toggling showGlass swaps glass/plain', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassNavBar(title: 'T', showGlass: false),
      ));
      await t.pumpAndSettle();
      expect(find.byType(GlassSurface), findsNothing);

      await t.pumpWidget(const CupertinoApp(
        home: GlassNavBar(title: 'T', showGlass: true),
      ));
      await t.pumpAndSettle();
      expect(find.byType(GlassSurface), findsOneWidget);
    });
  });
}
