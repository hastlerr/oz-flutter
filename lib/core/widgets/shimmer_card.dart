import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/dims.dart';

/// Loading placeholder shaped like a [GlassCard], shimmering while a feed
/// loads.
class ShimmerCard extends StatelessWidget {
  final double height;
  const ShimmerCard({super.key, this.height = 220});

  @override
  Widget build(BuildContext context) {
    final dark = CupertinoTheme.brightnessOf(context) == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: dark ? const Color(0xFF20251F) : const Color(0xFFE8E5DE),
      highlightColor: dark ? const Color(0xFF2A2F29) : const Color(0xFFF5F2EB),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          // Shimmer.fromColors paints its shader as a mask over this fill,
          // so only its opacity channel matters — white is a placeholder
          // that stays fully opaque under the mask, not a design token
          // pinned to the paper tones above (which the base/highlight
          // colors already tie to).
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(OzDims.radius),
        ),
      ),
    );
  }
}
