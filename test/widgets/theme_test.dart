import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/theme/colors.dart';
import 'package:oz_flutter/core/theme/glass.dart';

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
}
