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

  // warm-minimalism solid surfaces (cards/buttons/chips/search/sheets): a
  // notch "up" from paper so opaque content still reads as elevated without
  // any translucency. Dark mode elevates via a lighter surface tone instead
  // of a shadow (see OzShadows.card) — shadows don't read on a dark ground.
  static const surfaceLight = Color(0xFFFFFFFF);
  static const surfaceDark = Color(0xFF1E2420);
  // 1px hairline border for the solid kit's `bordered` outline style.
  static const hairlineLight = Color(0x14141413);
  static const hairlineDark = Color(0x1FECEFEA);

  static const CupertinoDynamicColor accent =
      CupertinoDynamicColor.withBrightness(
          color: emeraldLight, darkColor: emeraldDark);
  static const CupertinoDynamicColor paper =
      CupertinoDynamicColor.withBrightness(
          color: paperLight, darkColor: paperDark);
  static const CupertinoDynamicColor ink = CupertinoDynamicColor.withBrightness(
      color: inkLight, darkColor: inkDark);
  static const CupertinoDynamicColor inkSoft =
      CupertinoDynamicColor.withBrightness(
          color: inkSoftLight, darkColor: inkSoftDark);
  static const CupertinoDynamicColor surface =
      CupertinoDynamicColor.withBrightness(
          color: surfaceLight, darkColor: surfaceDark);
  static const CupertinoDynamicColor hairline =
      CupertinoDynamicColor.withBrightness(
          color: hairlineLight, darkColor: hairlineDark);
}
