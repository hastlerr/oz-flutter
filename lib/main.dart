import 'package:flutter/cupertino.dart';

import 'core/theme/app_theme.dart';
import 'features/showcase/screens/showcase_screen.dart';

/// `int.fromEnvironment` (not `double.fromEnvironment`, which doesn't exist)
/// lets `--dart-define=SHOWCASE_OFFSET=<px>` jump the showcase's initial
/// scroll position for simulator screenshots further down the page.
const _showcaseOffsetPx = int.fromEnvironment('SHOWCASE_OFFSET');

void main() => runApp(const OzApp());

class OzApp extends StatelessWidget {
  const OzApp({super.key});

  @override
  Widget build(BuildContext context) => CupertinoApp(
        title: 'OZ.KG',
        debugShowCheckedModeBanner: false,
        theme: ozTheme(),
        home: ShowcaseScreen(
          initialScrollOffset: _showcaseOffsetPx.toDouble(),
        ),
      );
}
