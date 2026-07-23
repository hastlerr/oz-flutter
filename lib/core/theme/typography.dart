import 'package:flutter/cupertino.dart';
import 'colors.dart';

abstract final class OzText {
  static const _base =
      TextStyle(fontFamily: 'CupertinoSystemText', letterSpacing: -0.2);
  static TextStyle largeTitle(BuildContext c) => _base.copyWith(
      fontSize: 34, fontWeight: FontWeight.w700, color: OzColors.ink.resolveFrom(c));
  static TextStyle title(BuildContext c) => _base.copyWith(
      fontSize: 22, fontWeight: FontWeight.w600, color: OzColors.ink.resolveFrom(c));
  static TextStyle body(BuildContext c) => _base.copyWith(
      fontSize: 16, color: OzColors.ink.resolveFrom(c));
  static TextStyle caption(BuildContext c) => _base.copyWith(
      fontSize: 13, color: OzColors.inkSoft.resolveFrom(c));
  static TextStyle price(BuildContext c) => TextStyle(
      fontFamily: 'Menlo', fontSize: 17, fontWeight: FontWeight.w700,
      color: OzColors.accent.resolveFrom(c));
}
