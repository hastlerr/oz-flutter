import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/glass.dart';
import 'package:oz_flutter/core/widgets/glass_surface.dart';

void main() {
  testWidgets('GlassSurface renders child', (t) async {
    await t.pumpWidget(const CupertinoApp(
        home: GlassSurface(level: GlassLevel.surface, child: Text('hi'))));
    expect(find.text('hi'), findsOneWidget);
  });
  testWidgets('GlassSurface applies padding', (t) async {
    await t.pumpWidget(const CupertinoApp(
        home: GlassSurface(
            level: GlassLevel.overlay,
            padding: EdgeInsets.all(8),
            child: Text('p'))));
    expect(find.byType(Padding), findsWidgets);
  });
}
