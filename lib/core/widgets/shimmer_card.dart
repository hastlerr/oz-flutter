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
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(OzDims.radius),
        ),
      ),
    );
  }
}
