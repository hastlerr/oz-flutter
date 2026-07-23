import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/colors.dart';
import 'package:oz_flutter/core/theme/dims.dart';
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

    testWidgets(
        'fits 5 real-world-length items at 393x852 with no overflow',
        (t) async {
      // Regression test for the review-round tab bar overflow: the
      // showcase's real item set, at a real phone width.
      const realItems = [
        GlassTabItem(CupertinoIcons.house_fill, 'Главная'),
        GlassTabItem(CupertinoIcons.square_grid_2x2_fill, 'Каталог'),
        GlassTabItem(CupertinoIcons.plus_circle_fill, 'Подать'),
        GlassTabItem(CupertinoIcons.heart_fill, 'Избранное'),
        GlassTabItem(CupertinoIcons.person_fill, 'Профиль'),
      ];
      await t.binding.setSurfaceSize(const Size(393, 852));
      t.view.physicalSize = const Size(393, 852);
      t.view.devicePixelRatio = 1.0;
      addTearDown(t.view.reset);
      addTearDown(() => t.binding.setSurfaceSize(null));

      await t.pumpWidget(CupertinoApp(
        home: Align(
          alignment: Alignment.bottomCenter,
          child: GlassTabBar(index: 0, items: realItems, onTap: (_) {}),
        ),
      ));
      await t.pumpAndSettle();

      expect(t.takeException(), isNull);
    });

    testWidgets('exposes tab semantics (button, selected, label)', (t) async {
      final handle = t.ensureSemantics();
      await t.pumpWidget(CupertinoApp(
        home: GlassTabBar(index: 0, items: items, onTap: (_) {}),
      ));
      await t.pumpAndSettle();

      expect(
        t.getSemantics(find.text('Главная')),
        matchesSemantics(
          label: 'Главная',
          isButton: true,
          isSelected: true,
          hasSelectedState: true,
          hasTapAction: true,
        ),
      );
      expect(
        t.getSemantics(find.text('Поиск')),
        matchesSemantics(
          label: 'Поиск',
          isButton: true,
          isSelected: false,
          hasSelectedState: true,
          hasTapAction: true,
        ),
      );

      handle.dispose();
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

    testWidgets(
        'pads body MediaQuery bottom by tabBarHeight+10 when tabBar is set',
        (t) async {
      late double bottom;
      await t.pumpWidget(CupertinoApp(
        home: GlassScaffold(
          tabBar: const Text('TABBAR'),
          body: Builder(builder: (context) {
            bottom = MediaQuery.paddingOf(context).bottom;
            return const SizedBox();
          }),
        ),
      ));

      expect(bottom, OzDims.tabBarHeight + 10);
    });

    testWidgets('pads body MediaQuery top by ~64 when navBar is set',
        (t) async {
      late double top;
      await t.pumpWidget(CupertinoApp(
        home: GlassScaffold(
          navBar: const Text('NAVBAR'),
          body: Builder(builder: (context) {
            top = MediaQuery.paddingOf(context).top;
            return const SizedBox();
          }),
        ),
      ));

      expect(top, 64);
    });

    testWidgets('does not pad body MediaQuery when no bars are set',
        (t) async {
      late EdgeInsets padding;
      await t.pumpWidget(CupertinoApp(
        home: GlassScaffold(
          body: Builder(builder: (context) {
            padding = MediaQuery.paddingOf(context);
            return const SizedBox();
          }),
        ),
      ));

      expect(padding, EdgeInsets.zero);
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
