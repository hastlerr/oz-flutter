import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/colors.dart';
import 'package:oz_flutter/core/theme/dims.dart';
import 'package:oz_flutter/core/widgets/oz_surface.dart';

void main() {
  testWidgets('OzSurface renders child', (t) async {
    await t.pumpWidget(const CupertinoApp(
      home: OzSurface(child: Text('hi')),
    ));
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets('OzSurface applies the given padding', (t) async {
    await t.pumpWidget(const CupertinoApp(
      home: OzSurface(padding: EdgeInsets.all(8), child: Text('p')),
    ));
    expect(
      find.byWidgetPredicate(
          (w) => w is Padding && w.padding == const EdgeInsets.all(8)),
      findsOneWidget,
    );
  });

  testWidgets('defaults: opaque surface color, default radius, no border, shadowed',
      (t) async {
    await t.pumpWidget(const CupertinoApp(
      home: OzSurface(child: Text('x')),
    ));
    final box = t.widget<DecoratedBox>(find.descendant(of: find.byType(OzSurface), matching: find.byType(DecoratedBox)).first);
    final decoration = box.decoration as BoxDecoration;

    // CupertinoDynamicColor.resolveFrom returns another CupertinoDynamicColor
    // (not a plain Color) on this Flutter version — compare by ARGB value.
    expect(decoration.color!.toARGB32(), OzColors.surfaceLight.toARGB32());
    expect(decoration.borderRadius, BorderRadius.circular(OzDims.radius));
    expect(decoration.border, isNull);
    expect(decoration.boxShadow, isNotEmpty);
  });

  testWidgets('bordered: true draws a hairline border', (t) async {
    await t.pumpWidget(const CupertinoApp(
      home: OzSurface(bordered: true, child: Text('x')),
    ));
    final box = t.widget<DecoratedBox>(find.descendant(of: find.byType(OzSurface), matching: find.byType(DecoratedBox)).first);
    final decoration = box.decoration as BoxDecoration;

    expect(decoration.border, isNotNull);
  });

  testWidgets('shadowed: false paints no shadow', (t) async {
    await t.pumpWidget(const CupertinoApp(
      home: OzSurface(shadowed: false, child: Text('x')),
    ));
    final box = t.widget<DecoratedBox>(find.descendant(of: find.byType(OzSurface), matching: find.byType(DecoratedBox)).first);
    final decoration = box.decoration as BoxDecoration;

    expect(decoration.boxShadow, isNull);
  });

  testWidgets('radius override applies to the surface', (t) async {
    await t.pumpWidget(const CupertinoApp(
      home: OzSurface(radius: 4, child: Text('x')),
    ));
    final box = t.widget<DecoratedBox>(find.descendant(of: find.byType(OzSurface), matching: find.byType(DecoratedBox)).first);
    final decoration = box.decoration as BoxDecoration;

    expect(decoration.borderRadius, BorderRadius.circular(4));
  });

  testWidgets('dark theme resolves the dark surface color and paints no shadow',
      (t) async {
    await t.pumpWidget(const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: OzSurface(child: Text('x')),
    ));
    final box = t.widget<DecoratedBox>(find.descendant(of: find.byType(OzSurface), matching: find.byType(DecoratedBox)).first);
    final decoration = box.decoration as BoxDecoration;

    expect(decoration.color!.toARGB32(), OzColors.surfaceDark.toARGB32());
    expect(decoration.boxShadow, isEmpty);
  });
}
