import 'package:flutter/cupertino.dart';

/// Elevation for the solid (warm-minimalism) kit — [OzSurface] and anything
/// built on it.
///
/// Light theme lifts a white/near-white surface off warm paper with a soft
/// drop shadow. Dark theme intentionally renders **no** shadow at all: a
/// shadow is just a darkened halo, and on an already-dark ground it either
/// vanishes or reads as a muddy smear rather than depth. Dark mode instead
/// gets its sense of elevation from [OzColors.surfaceDark] being a step
/// *lighter* than [OzColors.paperDark] — the same "lighter = closer" cue
/// Apple's own dark-mode elevation uses.
abstract final class OzShadows {
  static List<BoxShadow> card(BuildContext context) {
    final dark = CupertinoTheme.brightnessOf(context) == Brightness.dark;
    if (dark) return const [];
    return const [
      BoxShadow(
        color: Color(0x0F1B211E),
        blurRadius: 16,
        offset: Offset(0, 4),
      ),
    ];
  }
}
