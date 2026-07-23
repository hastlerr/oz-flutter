import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import '../theme/glass.dart';

/// Shares a single backdrop capture across every [GlassSurface] painted at
/// the same [GlassLevel] beneath it — e.g. a feed of 10+ glass cards —
/// instead of each one paying for its own layer.
///
/// liquid_glass_renderer's own `LiquidGlass.withOwnLayer` docs warn:
/// "creating many individual layers can be expensive", and its
/// `LiquidGlassLayer` docs say to prefer "rendering multiple LiquidGlass
/// shapes that share the same settings inside a single LiquidGlassLayer".
/// [OzGlassLayer] is that single shared layer for this app's design system:
/// on iOS it wraps its subtree in the package's real `LiquidGlassLayer` with
/// this level's full pinned [GlassTokens.specs] baked into the settings; on
/// every other platform it wraps in Flutter's `BackdropGroup` so descendant
/// fallback surfaces can use `BackdropFilter.grouped` and share one blur
/// capture instead of N.
///
/// IMPORTANT — placement: per liquid_glass_renderer's own `LiquidGlassLayer`
/// docs, "make sure not to stack any other widgets between the
/// LiquidGlassLayer and the LiquidGlass widgets, otherwise the liquid glass
/// effect will be behind them." The same constraint applies to
/// [OzGlassLayer]: it must sit directly above the [GlassSurface] children
/// meant to join it, with nothing (an `Opacity`, another backdrop filter,
/// etc.) stacked in between — otherwise those children silently fall back to
/// creating their own layer/backdrop instead of sharing this one, or the
/// shared capture ends up positioned wrong.
///
/// A [GlassSurface] looks up the nearest [OzGlassLayer] via [of] and only
/// joins it when [GlassSurface.level] matches [level] exactly; a
/// [GlassSurface] at a different level (or with no ancestor at all) is
/// unaffected and falls back to creating its own layer, so nesting stays
/// safe by default.
class OzGlassLayer extends InheritedWidget {
  OzGlassLayer({super.key, required this.level, required Widget child})
      : super(child: _OzGlassLayerBody(level: level, child: child));

  /// The glass hierarchy level every child [GlassSurface] sharing this layer
  /// must also be at.
  final GlassLevel level;

  static bool get liquid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  /// Returns the nearest ancestor [OzGlassLayer], or null if there is none.
  static OzGlassLayer? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<OzGlassLayer>();

  @override
  bool updateShouldNotify(covariant OzGlassLayer oldWidget) =>
      level != oldWidget.level;
}

/// Resolves this level's brightness-dependent tint from [context] and wraps
/// [child] in the real shared `LiquidGlassLayer` (iOS) or a `BackdropGroup`
/// (fallback everywhere else). Split out from [OzGlassLayer] itself because
/// [InheritedWidget] has no `build(context)` of its own to resolve the tint
/// with — [OzGlassLayer] still stays the object descendants look up via
/// [OzGlassLayer.of].
class _OzGlassLayerBody extends StatelessWidget {
  const _OzGlassLayerBody({required this.level, required this.child});

  final GlassLevel level;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!OzGlassLayer.liquid) {
      return BackdropGroup(child: child);
    }
    final spec = GlassTokens.specs[level]!;
    final tint = GlassTokens.tintColor(context, level);
    return LiquidGlassLayer(
      settings: LiquidGlassSettings(
        blur: spec.blur,
        glassColor: tint,
        thickness: spec.thickness,
        lightIntensity: spec.lightIntensity,
        saturation: spec.saturation,
        refractiveIndex: GlassTokens.refractiveIndex,
        chromaticAberration: GlassTokens.chromaticAberration,
        lightAngle: GlassTokens.lightAngle,
      ),
      child: child,
    );
  }
}
