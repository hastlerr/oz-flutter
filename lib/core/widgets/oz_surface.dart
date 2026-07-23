import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/shadows.dart';

/// The solid counterpart to [GlassSurface] — an opaque [OzColors.surface]
/// panel, optionally bordered and/or shadowed. This is the primitive every
/// non-chrome kit component (card, button, chip, search bar, sheet) builds
/// on under the warm-minimalism direction: glass stays reserved for
/// [GlassTabBar]/[GlassNavBar] (the floating chrome iOS itself renders in
/// glass); everything else — the content the user actually came for — is a
/// plain, confident, opaque surface.
class OzSurface extends StatelessWidget {
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry padding;

  /// Draws a 1px [OzColors.hairline] border — the `outline`-style affordance
  /// for buttons/chips/search that don't want a shadow.
  final bool bordered;

  /// Paints [OzShadows.card] behind the surface (a no-op in dark theme — see
  /// that doc comment for why).
  final bool shadowed;

  const OzSurface({
    super.key,
    required this.child,
    this.radius,
    this.padding = EdgeInsets.zero,
    this.bordered = false,
    this.shadowed = true,
  });

  @override
  Widget build(BuildContext context) {
    final r = radius ?? OzDims.radius;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: OzColors.surface.resolveFrom(context),
        borderRadius: BorderRadius.circular(r),
        border: bordered
            ? Border.all(color: OzColors.hairline.resolveFrom(context))
            : null,
        boxShadow: shadowed ? OzShadows.card(context) : null,
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
