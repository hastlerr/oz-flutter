import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/advertisement.dart';
import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/glass.dart';
import '../theme/typography.dart';
import 'glass_surface.dart';

const countryFlags = {
  'kg': '🇰🇬',
  'kr': '🇰🇷',
  'kz': '🇰🇿',
  'ge': '🇬🇪',
  'uz': '🇺🇿',
  'us': '🇺🇸',
};

/// Ad card for feeds.
///
/// Wrap feeds of these in `OzGlassLayer(level: GlassLevel.surface)` so all
/// cards share one glass layer (perf: see oz_glass_layer.dart).
class GlassCard extends StatelessWidget {
  final Advertisement ad;
  final VoidCallback onTap;
  final VoidCallback? onFavorite; // null = heart hidden
  const GlassCard({
    super.key,
    required this.ad,
    required this.onTap,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final usdValue = ad.priceUsd ?? ad.price;
    final usd =
        usdValue == null ? '—' : NumberFormat('#,###', 'ru').format(usdValue);
    return GestureDetector(
      onTap: onTap,
      child: GlassSurface(
        level: GlassLevel.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              AspectRatio(
                aspectRatio: 16 / 10,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(OzDims.radius)),
                  child: ad.images.isEmpty
                      ? ColoredBox(
                          color: OzColors.inkSoft
                              .resolveFrom(context)
                              .withValues(alpha: 0.15),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.car_detailed,
                              size: 48,
                              color: OzColors.inkSoft.resolveFrom(context),
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: ad.images.first.picture,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: _Badge(
                  text: ad.inCountry
                      ? 'В наличии'
                      : 'Под заказ ${countryFlags[ad.sourceCountry] ?? ''}'
                          .trim(),
                  accent: ad.inCountry,
                ),
              ),
              if (onFavorite != null)
                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                    onTap: onFavorite,
                    child: GlassSurface(
                      level: GlassLevel.overlay,
                      radius: 999,
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        ad.isFavorite
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        size: 20,
                        color: ad.isFavorite
                            ? OzColors.danger
                            : OzColors.ink.resolveFrom(context),
                      ),
                    ),
                  ),
                ),
            ]),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${ad.brand.name} ${ad.model.name}, ${ad.yearIssued}',
                    style: OzText.title(context).copyWith(fontSize: 17),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(children: [
                    Text('\$$usd', style: OzText.price(context)),
                    const Spacer(),
                    if (ad.updated != null)
                      Text(relativeTime(ad.updated!), style: OzText.caption(context)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final bool accent;
  const _Badge({required this.text, required this.accent});

  @override
  Widget build(BuildContext context) => GlassSurface(
        level: GlassLevel.overlay,
        radius: 8,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: accent
                ? OzColors.accent.resolveFrom(context)
                : OzColors.ink.resolveFrom(context),
          ),
        ),
      );
}

String relativeTime(DateTime dt) {
  final d = DateTime.now().difference(dt);
  if (d.inDays > 0) return '${d.inDays} дн. назад';
  if (d.inHours > 0) return '${d.inHours} ч. назад';
  return 'только что';
}
