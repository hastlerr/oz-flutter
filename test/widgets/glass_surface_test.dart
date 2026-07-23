import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:oz_flutter/core/theme/glass.dart';
import 'package:oz_flutter/core/widgets/glass_surface.dart';
import 'package:oz_flutter/core/widgets/oz_glass_layer.dart';

void main() {
  testWidgets('GlassSurface renders child', (t) async {
    await t.pumpWidget(const CupertinoApp(
        home: GlassSurface(level: GlassLevel.surface, child: Text('hi'))));
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets('GlassSurface applies the given padding', (t) async {
    await t.pumpWidget(const CupertinoApp(
        home: GlassSurface(
            level: GlassLevel.overlay,
            padding: EdgeInsets.all(8),
            child: Text('p'))));
    expect(
      find.byWidgetPredicate(
          (w) => w is Padding && w.padding == const EdgeInsets.all(8)),
      findsOneWidget,
    );
  });

  testWidgets(
      'fallback path (non-iOS host) renders a BackdropFilter, no LiquidGlass',
      (t) async {
    await t.pumpWidget(const CupertinoApp(
        home: GlassSurface(level: GlassLevel.surface, child: Text('x'))));
    expect(find.byType(BackdropFilter), findsOneWidget);
    expect(find.byType(LiquidGlass), findsNothing);
  });

  testWidgets('radius override applies to the fallback ClipRRect', (t) async {
    await t.pumpWidget(const CupertinoApp(
        home: GlassSurface(
            level: GlassLevel.chrome, radius: 4, child: Text('x'))));
    final clip = t.widget<ClipRRect>(find.byType(ClipRRect).first);
    expect(clip.borderRadius, BorderRadius.circular(4));
  });

  // The tests below force the iOS shader path via
  // debugDefaultTargetPlatformOverride. That flag is a global debug var that
  // Flutter's test harness asserts is back to null once a test's own body
  // returns (debugAssertAllFoundationVarsUnset, checked as part of
  // TestWidgetsFlutterBinding's post-test invariant check) — that check runs
  // *inside* the same test-body future package:test awaits, before any
  // tearDown/addTearDown callback gets a chance to run. So the reset has to
  // happen at the end of each test's own body (via try/finally, so it still
  // runs if an expectation throws), not in an external tearDown().
  testWidgets('standalone iOS path renders LiquidGlass with its own layer',
      (t) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    try {
      await t.pumpWidget(const CupertinoApp(
          home: GlassSurface(level: GlassLevel.surface, child: Text('x'))));
      expect(find.byType(LiquidGlass), findsOneWidget);
      // withOwnLayer creates its own LiquidGlassLayer — with no ancestor
      // OzGlassLayer to share, there should be exactly one.
      expect(find.byType(LiquidGlassLayer), findsOneWidget);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  group('sharing an ancestor OzGlassLayer', () {
    testWidgets(
        'iOS: matching-level children join the ancestor, no per-card own layer',
        (t) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      try {
        await t.pumpWidget(CupertinoApp(
            home: OzGlassLayer(
          level: GlassLevel.surface,
          child: Column(children: [
            GlassSurface(level: GlassLevel.surface, child: Text('a')),
            GlassSurface(level: GlassLevel.surface, child: Text('b')),
          ]),
        )));
        // Exactly one LiquidGlassLayer for the whole group — the ancestor's
        // — even though there are two glass shapes.
        expect(find.byType(LiquidGlassLayer), findsOneWidget);
        expect(find.byType(LiquidGlass), findsNWidgets(2));
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });

    testWidgets('iOS: a mismatched-level child still gets its own layer',
        (t) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      try {
        await t.pumpWidget(CupertinoApp(
            home: OzGlassLayer(
          level: GlassLevel.surface,
          child: GlassSurface(level: GlassLevel.overlay, child: Text('a')),
        )));
        // The ancestor's layer, plus the mismatched child's own — 2 total.
        expect(find.byType(LiquidGlassLayer), findsNWidgets(2));
      } finally {
        debugDefaultTargetPlatformOverride = null;
      }
    });

    testWidgets(
        'fallback: matching-level children render grouped BackdropFilters under one BackdropGroup',
        (t) async {
      await t.pumpWidget(CupertinoApp(
          home: OzGlassLayer(
        level: GlassLevel.surface,
        child: Column(children: [
          GlassSurface(level: GlassLevel.surface, child: Text('a')),
          GlassSurface(level: GlassLevel.surface, child: Text('b')),
        ]),
      )));
      expect(find.byType(BackdropGroup), findsOneWidget);
      expect(find.byType(BackdropFilter), findsNWidgets(2));
    });
  });
}
