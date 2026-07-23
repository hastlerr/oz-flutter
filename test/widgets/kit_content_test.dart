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
  });
}
