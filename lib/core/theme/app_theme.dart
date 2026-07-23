import 'package:flutter/cupertino.dart';
import 'colors.dart';

CupertinoThemeData ozTheme(Brightness brightness) => CupertinoThemeData(
      brightness: brightness,
      primaryColor: OzColors.accent,
      scaffoldBackgroundColor: OzColors.paper,
      barBackgroundColor: const Color(0x00000000),
    );
