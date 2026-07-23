import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/app_theme.dart';
import 'package:oz_flutter/core/theme/colors.dart';
import 'package:oz_flutter/core/theme/glass.dart';
import 'package:oz_flutter/core/theme/shadows.dart';

void main() {
  for (final b in [Brightness.light, Brightness.dark]) {
    testWidgets('tokens resolve in $b', (t) async {
      late Color accent;
      late Color glass;
      await t.pumpWidget(CupertinoApp(
          theme: CupertinoThemeData(brightness: b),
          home: Builder(builder: (c) {
            accent = OzColors.accent.resolveFrom(c);
            glass = GlassTokens.tintColor(c, GlassLevel.chrome);
            return const SizedBox();
          })));
      final expected =
          b == Brightness.dark ? OzColors.emeraldDark : OzColors.emeraldLight;
      // CupertinoDynamicColor.resolveFrom returns another CupertinoDynamicColor
      // (not a plain Color) on this Flutter version, so compare by ARGB value
      // rather than object identity/type.
      expect(accent.toARGB32(), expected.toARGB32());
      expect(glass.a, closeTo(0.55, 0.01));
    });
  }

  test('surface and overlay tintOpacity tokens are pinned as designed', () {
    expect(GlassTokens.specs[GlassLevel.surface]!.tintOpacity, 0.42);
    expect(GlassTokens.specs[GlassLevel.overlay]!.tintOpacity, 0.30);
  });

  for (final b in [Brightness.light, Brightness.dark]) {
    testWidgets(
        'ozTheme() with no explicit brightness tracks platformBrightness ($b)',
        (t) async {
      late Color accent;
      await t.pumpWidget(MediaQuery(
        data: MediaQueryData(platformBrightness: b),
        child: CupertinoApp(
          theme: ozTheme(),
          home: Builder(builder: (c) {
            accent = OzColors.accent.resolveFrom(c);
            return const SizedBox();
          }),
        ),
      ));
      final expected =
          b == Brightness.dark ? OzColors.emeraldDark : OzColors.emeraldLight;
      expect(accent.toARGB32(), expected.toARGB32());
    });
  }

  group('warm-minimalism solid-surface tokens', () {
    for (final b in [Brightness.light, Brightness.dark]) {
      testWidgets('OzColors.surface/hairline resolve in $b', (t) async {
        late Color surface;
        late Color hairline;
        await t.pumpWidget(CupertinoApp(
            theme: CupertinoThemeData(brightness: b),
            home: Builder(builder: (c) {
              surface = OzColors.surface.resolveFrom(c);
              hairline = OzColors.hairline.resolveFrom(c);
              return const SizedBox();
            })));
        final expectedSurface =
            b == Brightness.dark ? OzColors.surfaceDark : OzColors.surfaceLight;
        final expectedHairline = b == Brightness.dark
            ? OzColors.hairlineDark
            : OzColors.hairlineLight;
        expect(surface.toARGB32(), expectedSurface.toARGB32());
        expect(hairline.toARGB32(), expectedHairline.toARGB32());
      });
    }

    testWidgets('OzShadows.card is non-empty in light, empty in dark',
        (t) async {
      late List<BoxShadow> lightShadow;
      late List<BoxShadow> darkShadow;
      await t.pumpWidget(CupertinoApp(
        theme: const CupertinoThemeData(brightness: Brightness.light),
        home: Builder(builder: (c) {
          lightShadow = OzShadows.card(c);
          return const SizedBox();
        }),
      ));
      await t.pumpWidget(CupertinoApp(
        theme: const CupertinoThemeData(brightness: Brightness.dark),
        home: Builder(builder: (c) {
          darkShadow = OzShadows.card(c);
          return const SizedBox();
        }),
      ));

      expect(lightShadow, isNotEmpty);
      expect(lightShadow.single.blurRadius, 16);
      expect(lightShadow.single.offset, const Offset(0, 4));
      expect(darkShadow, isEmpty);
    });
  });
}
