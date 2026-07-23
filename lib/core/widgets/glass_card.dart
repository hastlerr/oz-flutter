import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/advertisement.dart';
import '../theme/colors.dart';
import '../theme/dims.dart';
import '../theme/glass.dart';
import '../theme/typography.dart';
import 'glass_surface.dart';

/// Emoji flag per `source_country` code, shown on the "under order" badge.
///
/// TODO(domain-constants): move this to a shared domain-constants file once
/// a second consumer (e.g. a country picker) needs it — kept local to
/// [GlassCard] for now since it's the only user.
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
/// cards share one glass layer (perf: see oz_glass_layer.dart). The badge and
/// favorite heart are deliberately *not* `GlassSurface`s themselves (they'd
/// be `GlassLevel.overlay`, mismatched against a feed's `surface`-level
/// `OzGlassLayer`, forcing each one to stand up its own extra shader layer —
/// up to 2 per card, which defeats the point of the shared layer) — they're
/// plain solid semi-opaque fills instead.
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

  static final _priceFormat = NumberFormat('#,###', 'ru');

  @override
  Widget build(BuildContext context) {
    final usdValue = ad.priceUsd ?? ad.price;
    final usd = usdValue == null ? '—' : _priceFormat.format(usdValue);
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
                      ? _imagePlaceholder(context)
                      : CachedNetworkImage(
                          imageUrl: ad.images.first.picture,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          memCacheWidth: 800,
                          errorWidget: (context, url, error) =>
                              _imagePlaceholder(context),
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
                    child: Semantics(
                      button: true,
                      label: ad.isFavorite ? 'Убрать из избранного' : 'В избранное',
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: OzColors.paper
                              .resolveFrom(context)
                              .withValues(alpha: 0.82),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
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
                    // Both price and timestamp shrink/ellipsize instead of
                    // overflowing at narrow card widths (~150-190pt, e.g. a
                    // future 2-up grid) — see the narrow-width widget test.
                    Flexible(
                      flex: 3,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text('\$$usd', style: OzText.price(context)),
                      ),
                    ),
                    if (ad.updated != null) ...[
                      const SizedBox(width: 8),
                      Flexible(
                        flex: 2,
                        child: Text(
                          relativeTime(ad.updated!),
                          style: OzText.caption(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder(BuildContext context) => ColoredBox(
        color: OzColors.inkSoft.resolveFrom(context).withValues(alpha: 0.15),
        child: Center(
          child: Icon(
            CupertinoIcons.car_detailed,
            size: 48,
            color: OzColors.inkSoft.resolveFrom(context),
          ),
        ),
      );
}

class _Badge extends StatelessWidget {
  final String text;
  final bool accent;
  const _Badge({required this.text, required this.accent});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: OzColors.paper.resolveFrom(context).withValues(alpha: 0.82),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
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
        ),
      );
}

/// Coarse "time ago" label for a card's `updated` timestamp. [now] defaults
/// to [DateTime.now] but can be pinned for deterministic tests.
String relativeTime(DateTime dt, {DateTime? now}) {
  final d = (now ?? DateTime.now()).difference(dt);
  if (d.inDays > 0) return '${d.inDays} дн. назад';
  if (d.inHours > 0) return '${d.inHours} ч. назад';
  return 'только что';
}
