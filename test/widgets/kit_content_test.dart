import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/models/advertisement.dart';
import 'package:oz_flutter/core/widgets/glass_button.dart';
import 'package:oz_flutter/core/widgets/glass_card.dart';
import 'package:oz_flutter/core/widgets/glass_chip.dart';
import 'package:oz_flutter/core/widgets/glass_search_bar.dart';
import 'package:oz_flutter/core/widgets/glass_sheet.dart';
import 'package:oz_flutter/core/widgets/glass_surface.dart';

Map<String, dynamic> _readJson(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

void main() {
  final page = _readJson('test/fixtures/cars_page1.json');
  final firstAdJson =
      (page['results'] as List).first as Map<String, dynamic>;
  final ad = Advertisement.fromJson(firstAdJson);

  group('Advertisement parsing (cars_page1 fixture results[0])', () {
    test('parses into an Advertisement with sane brand/model/price', () {
      expect(ad.brand.name, isNotEmpty);
      expect(ad.model.name, isNotEmpty);
      expect(ad.priceUsd ?? ad.price, isNotNull);
      expect(ad.yearIssued, greaterThan(0));
    });
  });

  group('GlassCard', () {
    testWidgets('renders brand+model text, price, and badge text',
        (t) async {
      await t.pumpWidget(CupertinoApp(home: GlassCard(ad: ad, onTap: () {})));
      await t.pump();

      expect(
        find.textContaining('${ad.brand.name} ${ad.model.name}'),
        findsOneWidget,
      );
      expect(find.textContaining('\$'), findsOneWidget);
      // fixture ad has in_country: false -> "under order" badge.
      expect(ad.inCountry, isFalse);
      expect(find.textContaining('Под заказ'), findsOneWidget);
    });

    testWidgets('shows "in stock" badge when inCountry is true', (t) async {
      final inStockAd = ad.copyWith(inCountry: true);
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: inStockAd, onTap: () {})));
      await t.pump();

      expect(find.textContaining('В наличии'), findsOneWidget);
    });

    testWidgets('heart hidden when onFavorite is null', (t) async {
      await t.pumpWidget(CupertinoApp(home: GlassCard(ad: ad, onTap: () {})));
      await t.pump();

      expect(find.byIcon(CupertinoIcons.heart), findsNothing);
      expect(find.byIcon(CupertinoIcons.heart_fill), findsNothing);
    });

    testWidgets('heart visible and tappable when onFavorite is provided',
        (t) async {
      var tapped = false;
      await t.pumpWidget(CupertinoApp(
        home: GlassCard(
          ad: ad.copyWith(isFavorite: false),
          onTap: () {},
          onFavorite: () => tapped = true,
        ),
      ));
      await t.pump();

      expect(find.byIcon(CupertinoIcons.heart), findsOneWidget);
      await t.tap(find.byIcon(CupertinoIcons.heart));
      await t.pump();
      expect(tapped, isTrue);
    });

    testWidgets('placeholder icon shown when images list is empty',
        (t) async {
      final noImageAd = ad.copyWith(images: const []);
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: noImageAd, onTap: () {})));
      await t.pump();

      expect(find.byIcon(CupertinoIcons.car_detailed), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsNothing);
    });

    testWidgets('CachedNetworkImage used when an image is present',
        (t) async {
      final withImageAd = ad.copyWith(
        images: const [AdImage(picture: 'https://example.com/x.jpg')],
      );
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: withImageAd, onTap: () {})));
      // Deliberately no pumpAndSettle: avoid resolving the fake network
      // image in a widget test — just confirm the widget was built.
      await t.pump();

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('onTap fires when the card is tapped', (t) async {
      var tapped = false;
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: ad, onTap: () => tapped = true)));
      await t.pump();

      await t.tap(find.byType(GlassCard));
      await t.pump();
      expect(tapped, isTrue);
    });

    testWidgets('shows an em dash when both price and priceUsd are null',
        (t) async {
      final noPriceAd = ad.copyWith(price: null, priceUsd: null);
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: noPriceAd, onTap: () {})));
      await t.pump();

      expect(find.text('\$—'), findsOneWidget);
    });

    testWidgets('renders no timestamp when updated is null', (t) async {
      final noUpdatedAd = ad.copyWith(updated: null);
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: noUpdatedAd, onTap: () {})));
      await t.pump();

      expect(find.textContaining('назад'), findsNothing);
      expect(find.text('только что'), findsNothing);
    });

    testWidgets('badge omits the flag when sourceCountry is null',
        (t) async {
      final noCountryAd =
          ad.copyWith(inCountry: false, sourceCountry: null);
      await t.pumpWidget(
          CupertinoApp(home: GlassCard(ad: noCountryAd, onTap: () {})));
      await t.pump();

      // Exact match (not textContaining) — no trailing flag/space.
      expect(find.text('Под заказ'), findsOneWidget);
    });

    testWidgets(
        'badge and favorite heart are solid fills — no extra GlassSurface per card',
        (t) async {
      await t.pumpWidget(CupertinoApp(
        home: GlassCard(ad: ad, onTap: () {}, onFavorite: () {}),
      ));
      await t.pump();

      // Only the card's own GlassLevel.surface GlassSurface — the badge and
      // heart no longer stand up their own (mismatched-level) GlassSurfaces,
      // which under a feed's OzGlassLayer(surface) would otherwise force up
      // to 2 extra shader layers per card.
      expect(find.byType(GlassSurface), findsOneWidget);
    });

    testWidgets('favorite heart exposes button semantics with a state label',
        (t) async {
      final handle = t.ensureSemantics();
      await t.pumpWidget(CupertinoApp(
        home: GlassCard(
          ad: ad.copyWith(isFavorite: false),
          onTap: () {},
          onFavorite: () {},
        ),
      ));
      await t.pump();

      expect(
        t.getSemantics(find.byIcon(CupertinoIcons.heart)),
        matchesSemantics(
          label: 'В избранное',
          isButton: true,
          hasTapAction: true,
        ),
      );

      handle.dispose();
    });

    testWidgets('renders without exceptions at a narrow 170pt width',
        (t) async {
      await t.pumpWidget(CupertinoApp(
        home: Center(
          child: SizedBox(width: 170, child: GlassCard(ad: ad, onTap: () {})),
        ),
      ));
      await t.pump();

      expect(t.takeException(), isNull);
    });
  });

  group('relativeTime', () {
    final now = DateTime(2026, 1, 10, 12, 0);

    test('under an hour ago -> "только что"', () {
      expect(
        relativeTime(now.subtract(const Duration(minutes: 30)), now: now),
        'только что',
      );
    });

    test('a few hours ago -> "N ч. назад"', () {
      expect(
        relativeTime(now.subtract(const Duration(hours: 5)), now: now),
        '5 ч. назад',
      );
    });

    test('a few days ago -> "N дн. назад"', () {
      expect(
        relativeTime(now.subtract(const Duration(days: 3)), now: now),
        '3 дн. назад',
      );
    });

    test('exactly on an hour boundary counts as that many hours', () {
      expect(
        relativeTime(now.subtract(const Duration(hours: 1)), now: now),
        '1 ч. назад',
      );
    });

    test('exactly on a day boundary counts as that many days', () {
      expect(
        relativeTime(now.subtract(const Duration(days: 1)), now: now),
        '1 дн. назад',
      );
    });
  });

  group('GlassChip', () {
    testWidgets('fires onTap', (t) async {
      var tapped = false;
      await t.pumpWidget(CupertinoApp(
        home: GlassChip(label: 'Внедорожник', selected: false, onTap: () => tapped = true),
      ));

      await t.tap(find.text('Внедорожник'));
      await t.pump();

      expect(tapped, isTrue);
    });

    testWidgets('renders label text regardless of selected state', (t) async {
      await t.pumpWidget(CupertinoApp(
        home: GlassChip(label: 'Седан', selected: true, onTap: () {}),
      ));
      await t.pump();

      expect(find.text('Седан'), findsOneWidget);
    });

    testWidgets('hit target is at least 44pt tall even though the pill is shorter',
        (t) async {
      await t.pumpWidget(CupertinoApp(
        home: Center(
          child: GlassChip(label: 'X', selected: false, onTap: () {}),
        ),
      ));
      await t.pump();

      final size = t.getSize(find.byType(GlassChip));
      expect(size.height, greaterThanOrEqualTo(44));
    });

    testWidgets('exposes button/selected semantics', (t) async {
      final handle = t.ensureSemantics();
      await t.pumpWidget(CupertinoApp(
        home: GlassChip(label: 'Ош', selected: true, onTap: () {}),
      ));
      await t.pump();

      expect(
        t.getSemantics(find.byType(GlassChip)),
        matchesSemantics(
          label: 'Ош',
          isButton: true,
          isSelected: true,
          hasSelectedState: true,
          hasTapAction: true,
        ),
      );

      handle.dispose();
    });
  });

  group('GlassButton', () {
    testWidgets('fires onPressed when enabled', (t) async {
      var tapped = false;
      await t.pumpWidget(CupertinoApp(
        home: GlassButton(label: 'Сохранить', onPressed: () => tapped = true),
      ));

      await t.tap(find.text('Сохранить'));
      await t.pump();

      expect(tapped, isTrue);
    });

    testWidgets('disabled (onPressed null) does not throw on tap', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassButton(label: 'Сохранить', onPressed: null),
      ));

      await t.tap(find.text('Сохранить'));
      await t.pump();
      // No exception thrown = pass. Also confirm the disabled visual.
      expect(find.text('Сохранить'), findsOneWidget);
    });

    testWidgets('outline (filled: false) renders inside a GlassSurface',
        (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassButton(label: 'Отмена', filled: false, onPressed: null),
      ));
      await t.pump();

      expect(find.byType(GlassSurface), findsOneWidget);
    });

    testWidgets('exposes enabled/disabled button semantics', (t) async {
      final handle = t.ensureSemantics();
      await t.pumpWidget(CupertinoApp(
        home: Column(children: [
          GlassButton(label: 'Включена', onPressed: () {}),
          const GlassButton(label: 'Выключена', onPressed: null),
        ]),
      ));
      await t.pump();

      expect(
        t.getSemantics(find.text('Включена')),
        matchesSemantics(
          label: 'Включена',
          isButton: true,
          isEnabled: true,
          hasEnabledState: true,
          hasTapAction: true,
        ),
      );
      expect(
        t.getSemantics(find.text('Выключена')),
        matchesSemantics(
          label: 'Выключена',
          isButton: true,
          isEnabled: false,
          hasEnabledState: true,
        ),
      );

      handle.dispose();
    });
  });

  group('GlassSearchBar', () {
    testWidgets('shows placeholder text when disabled', (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassSearchBar(enabled: false, placeholder: 'Найти авто'),
      ));

      expect(find.text('Найти авто'), findsOneWidget);
      expect(find.byType(CupertinoTextField), findsNothing);
    });

    testWidgets('shows an editable CupertinoTextField when enabled',
        (t) async {
      await t.pumpWidget(const CupertinoApp(
        home: GlassSearchBar(enabled: true, placeholder: 'Найти авто'),
      ));

      expect(find.byType(CupertinoTextField), findsOneWidget);
    });

    testWidgets('onTap fires (tap-through when disabled)', (t) async {
      var tapped = false;
      await t.pumpWidget(CupertinoApp(
        home: GlassSearchBar(enabled: false, onTap: () => tapped = true),
      ));

      await t.tap(find.byType(GlassSearchBar));
      await t.pump();
      expect(tapped, isTrue);
    });
  });

  group('showGlassSheet', () {
    testWidgets('opens a modal popup hosting the given child', (t) async {
      await t.pumpWidget(CupertinoApp(
        home: Builder(builder: (context) {
          return CupertinoButton(
            onPressed: () => showGlassSheet<void>(
              context,
              child: const Center(child: Text('SHEET CONTENT')),
            ),
            child: const Text('open'),
          );
        }),
      ));

      await t.tap(find.text('open'));
      await t.pumpAndSettle();

      expect(find.text('SHEET CONTENT'), findsOneWidget);
      expect(find.byType(GlassSurface), findsOneWidget);
    });

    testWidgets('rounds only the top corners', (t) async {
      await t.pumpWidget(CupertinoApp(
        home: Builder(builder: (context) {
          return CupertinoButton(
            onPressed: () =>
                showGlassSheet<void>(context, child: const SizedBox()),
            child: const Text('open'),
          );
        }),
      ));

      await t.tap(find.text('open'));
      await t.pumpAndSettle();

      final clip = t.widget<ClipRRect>(find.ancestor(
        of: find.byType(GlassSurface),
        matching: find.byType(ClipRRect),
      ));
      final radius = clip.borderRadius as BorderRadius;
      expect(radius.topLeft.x, greaterThan(0));
      expect(radius.topRight.x, greaterThan(0));
      expect(radius.bottomLeft, Radius.zero);
      expect(radius.bottomRight, Radius.zero);
    });

    testWidgets('pads the sheet body by the live keyboard inset', (t) async {
      addTearDown(t.view.resetViewInsets);
      await t.pumpWidget(CupertinoApp(
        home: Builder(builder: (context) {
          return CupertinoButton(
            onPressed: () =>
                showGlassSheet<void>(context, child: const SizedBox()),
            child: const Text('open'),
          );
        }),
      ));

      await t.tap(find.text('open'));
      await t.pumpAndSettle();

      t.view.viewInsets = const FakeViewPadding(bottom: 300);
      await t.pump();
      await t.pump(const Duration(milliseconds: 200));

      final padding =
          t.widget<AnimatedPadding>(find.byType(AnimatedPadding)).padding
              as EdgeInsets;
      expect(padding.bottom, greaterThan(0));
    });
  });
}
