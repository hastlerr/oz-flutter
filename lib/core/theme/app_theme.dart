import 'package:flutter/cupertino.dart';
import 'colors.dart';

/// [brightness] defaults to null (not a fixed [Brightness]): a null
/// `CupertinoThemeData.brightness` makes `CupertinoTheme.brightnessOf` fall
/// back to `MediaQuery.platformBrightnessOf(context)` on every resolve, so
/// `OzColors`' `CupertinoDynamicColor`s track the live platform/system
/// brightness instead of being frozen to whatever brightness was current
/// when `ozTheme()` happened to be called. Pass an explicit [Brightness] only
/// to force one (e.g. previewing dark mode).
CupertinoThemeData ozTheme([Brightness? brightness]) => CupertinoThemeData(
      brightness: brightness,
      primaryColor: OzColors.accent,
      scaffoldBackgroundColor: OzColors.paper,
      // Transparent bar background is intentional, not an oversight: the app
      // renders its own custom GlassNavBar (built on GlassSurface) rather
      // than the stock CupertinoNavigationBar/CupertinoTabBar. A stock bar
      // paints its own opaque/blurred background, which would double-blur
      // when stacked over a GlassSurface underneath it.
      barBackgroundColor: const Color(0x00000000),
    );
