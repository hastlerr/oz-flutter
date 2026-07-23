import 'package:flutter/cupertino.dart';

abstract final class OzColors {
  // brand (from oz.kg docs)
  static const emeraldLight = Color(0xFF0E5C4C);
  static const emeraldDark = Color(0xFF3BB08D);
  static const gold = Color(0xFFE8B23A);
  // light theme
  static const paperLight = Color(0xFFF7F5F0);
  static const inkLight = Color(0xFF1B211E);
  static const inkSoftLight = Color(0xFF59635C);
  // dark theme
  static const paperDark = Color(0xFF121513);
  static const inkDark = Color(0xFFECEFEA);
  static const inkSoftDark = Color(0xFF9EA9A1);
  // semantic
  static const danger = Color(0xFFE05252);

  static CupertinoDynamicColor get accent =>
      const CupertinoDynamicColor.withBrightness(
          color: emeraldLight, darkColor: emeraldDark);
  static CupertinoDynamicColor get paper =>
      const CupertinoDynamicColor.withBrightness(
          color: paperLight, darkColor: paperDark);
  static CupertinoDynamicColor get ink =>
      const CupertinoDynamicColor.withBrightness(
          color: inkLight, darkColor: inkDark);
  static CupertinoDynamicColor get inkSoft =>
      const CupertinoDynamicColor.withBrightness(
          color: inkSoftLight, darkColor: inkSoftDark);
}
