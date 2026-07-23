import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/app_theme.dart';
import 'package:oz_flutter/features/showcase/screens/showcase_screen.dart';

/// Golden coverage for the design-system showcase ("witness") screen.
///
/// Approach: `demoImagesEnabled: false` (a `@visibleForTesting` constructor
/// param on [ShowcaseScreen]) swaps the image-bearing demo ad to an empty
/// image list, so the whole pump is network-free — no fake `HttpOverrides`
/// needed. The screen is tall (many stacked sections), so the surface is
/// sized generously (393x2400) to capture every section in one golden.
const _size = Size(393, 2400);

void main() {
  Future<void> pumpShowcase(WidgetTester tester, Brightness brightness) async {
    await tester.binding.setSurfaceSize(_size);
    tester.view.physicalSize = _size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: _size, platformBrightness: brightness),
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: ozTheme(brightness),
          home: const ShowcaseScreen(demoImagesEnabled: false),
        ),
      ),
    );
    // Settle the tab-bar's AnimatedContainer / nav bar's AnimatedSwitcher
    // with a bounded pump rather than `pumpAndSettle()` — `ShimmerCard`
    // (states section) drives an infinitely-repeating animation, so
    // `pumpAndSettle` would spin until it times out.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  testWidgets('showcase screen — light theme', (tester) async {
    await pumpShowcase(tester, Brightness.light);
    await expectLater(
      find.byType(ShowcaseScreen),
      matchesGoldenFile('showcase_light.png'),
    );
  });

  testWidgets('showcase screen — dark theme', (tester) async {
    await pumpShowcase(tester, Brightness.dark);
    await expectLater(
      find.byType(ShowcaseScreen),
      matchesGoldenFile('showcase_dark.png'),
    );
  });
}
