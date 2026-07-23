import 'package:flutter/cupertino.dart';

import '../../../core/models/advertisement.dart';
import '../../../core/models/brand.dart';
import '../../../core/models/car_model.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/dims.dart';
import '../../../core/theme/glass.dart';
import '../../../core/theme/typography.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/error_retry.dart';
import '../../../core/widgets/glass_button.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/glass_chip.dart';
import '../../../core/widgets/glass_nav_bar.dart';
import '../../../core/widgets/glass_scaffold.dart';
import '../../../core/widgets/glass_search_bar.dart';
import '../../../core/widgets/glass_sheet.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/widgets/glass_tab_bar.dart';
import '../../../core/widgets/oz_glass_layer.dart';
import '../../../core/widgets/shimmer_card.dart';

/// Debug/witness screen presenting every kit component in one place — the
/// "component gallery" the design system is judged by. Not part of the
/// user-facing app flow.
class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({
    super.key,
    this.initialScrollOffset = 0,
    @visibleForTesting this.demoImagesEnabled = true,
  });

  /// Lets `--dart-define=SHOWCASE_OFFSET=<px>` jump the initial scroll
  /// position, so simulator screenshots can capture sections further down
  /// the page without scripted scrolling.
  final double initialScrollOffset;

  /// Golden tests flip this to `false` so the image-bearing demo card falls
  /// back to the empty-images placeholder art instead of hitting the
  /// network — keeps goldens deterministic without a fake HTTP client.
  final bool demoImagesEnabled;

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  late final ScrollController _scroll;
  late bool _showNavGlass;
  int _tabIndex = 0;
  int _chipIndex = 0;

  @override
  void initState() {
    super.initState();
    _scroll = ScrollController(initialScrollOffset: widget.initialScrollOffset)
      ..addListener(_onScroll);
    _showNavGlass = widget.initialScrollOffset > 8;
  }

  void _onScroll() {
    final show = _scroll.offset > 8;
    if (show != _showNavGlass) setState(() => _showNavGlass = show);
  }

  @override
  void dispose() {
    _scroll
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GlassScaffold(
        navBar: GlassNavBar(title: 'OZ Kit', showGlass: _showNavGlass),
        tabBar: GlassTabBar(
          index: _tabIndex,
          onTap: (i) => setState(() => _tabIndex = i),
          items: const [
            GlassTabItem(CupertinoIcons.house_fill, 'Главная'),
            GlassTabItem(CupertinoIcons.square_grid_2x2_fill, 'Каталог'),
            GlassTabItem(CupertinoIcons.plus_circle_fill, 'Подать'),
            GlassTabItem(CupertinoIcons.heart_fill, 'Избранное'),
            GlassTabItem(CupertinoIcons.person_fill, 'Профиль'),
          ],
        ),
        // GlassScaffold now reserves top/bottom MediaQuery padding for the
        // navBar/tabBar it paints in its Stack (see its doc comment) — read
        // that back here (via a Builder, so `context` is inside the
        // scaffold's own MediaQuery override) instead of re-deriving the bar
        // heights by hand; only the small breathing-room additions (8pt
        // top, 24pt bottom) are this screen's own.
        body: Builder(builder: (context) {
          final safe = MediaQuery.paddingOf(context);
          return ListView(
            controller: _scroll,
            padding: EdgeInsets.fromLTRB(
              OzDims.pad,
              safe.top + 8,
              OzDims.pad,
              safe.bottom + 24,
            ),
            children: [
              _paletteSection(context),
              const SizedBox(height: 28),
              _typographySection(context),
              const SizedBox(height: 28),
              _glassLevelsSection(context),
              const SizedBox(height: 28),
              _cardsSection(context),
              const SizedBox(height: 28),
              _buttonsSection(context),
              const SizedBox(height: 28),
              _searchSection(context),
              const SizedBox(height: 28),
              _sheetSection(context),
              const SizedBox(height: 28),
              _statesSection(context),
            ],
          );
        }),
      );

  // ---- 1. Палитра ----------------------------------------------------

  Widget _paletteSection(BuildContext context) {
    final swatches = [
      _Swatch('accent', OzColors.accent.resolveFrom(context)),
      _Swatch('gold', OzColors.gold),
      _Swatch('danger', OzColors.danger),
      _Swatch('paper', OzColors.paper.resolveFrom(context)),
      _Swatch('ink', OzColors.ink.resolveFrom(context)),
      _Swatch('inkSoft', OzColors.inkSoft.resolveFrom(context)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Палитра'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final s in swatches)
              SizedBox(
                // Fixed width so a caption wider than the 44pt swatch (e.g.
                // "inkSoft") can't push this Row past the screen edge.
                width: 48,
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: s.color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: OzColors.inkSoft
                              .resolveFrom(context)
                              .withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      s.name,
                      style: OzText.caption(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  // ---- 2. Типографика --------------------------------------------------

  Widget _typographySection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Типографика'),
          Text('Заголовок 34', style: OzText.largeTitle(context)),
          const SizedBox(height: 10),
          Text('Тайтл 22', style: OzText.title(context)),
          const SizedBox(height: 10),
          Text('Основной текст 16', style: OzText.body(context)),
          const SizedBox(height: 10),
          Text('Подпись 13', style: OzText.caption(context)),
          const SizedBox(height: 10),
          Text('\$ 12 700', style: OzText.price(context)),
        ],
      );

  // ---- 3. Стекло 3 уровня ----------------------------------------------

  Widget _glassLevelsSection(BuildContext context) {
    final accent = OzColors.accent.resolveFrom(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Стекло — 3 уровня'),
        ClipRRect(
          borderRadius: BorderRadius.circular(OzDims.radiusL),
          child: Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        accent.withValues(alpha: 0.6),
                        OzColors.gold.withValues(alpha: 0.6),
                        OzColors.danger.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: _levelBlock(context, GlassLevel.chrome, 'chrome'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child:
                          _levelBlock(context, GlassLevel.surface, 'surface'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child:
                          _levelBlock(context, GlassLevel.overlay, 'overlay'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _levelBlock(BuildContext context, GlassLevel level, String name) =>
      GlassSurface(
        level: level,
        child: SizedBox(
          height: 72,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Menlo',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: OzColors.ink.resolveFrom(context),
              ),
            ),
          ),
        ),
      );

  // ---- 4. Карточка объявления -------------------------------------------

  Widget _cardsSection(BuildContext context) {
    final inStock = Advertisement(
      id: 14672,
      brand: const Brand(id: 212, name: 'Nissan', slug: 'nissan'),
      model: const CarModel(id: 24134, name: 'Другая модель'),
      yearIssued: 2020,
      price: 54754,
      priceUsd: 54754,
      currency: 'usd',
      images: widget.demoImagesEnabled
          ? const [
              AdImage(
                picture: 'https://oz.kg/media/car/14672/images/image',
                order: 1,
              ),
              AdImage(
                picture:
                    'https://oz.kg/media/car/14672/images/image_P7M5zJv',
                order: 2,
              ),
            ]
          : const [],
      sourceCountry: 'uz',
      inCountry: true,
      updated: DateTime.now().subtract(const Duration(hours: 3)),
    );

    final preOrder = Advertisement(
      id: 90001,
      brand: const Brand(id: 900, name: 'Kia'),
      model: const CarModel(id: 9001, name: 'Sportage'),
      yearIssued: 2024,
      price: 32000,
      priceUsd: 32000,
      currency: 'usd',
      images: const [],
      sourceCountry: 'kr',
      inCountry: false,
      isFavorite: true,
      updated: DateTime.now().subtract(const Duration(days: 1)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Карточка объявления'),
        // Stacked full-width (not a 2-up Row): at this screen's ~360pt
        // content width, a side-by-side squeeze leaves each card only
        // ~150pt of internal content width, which overflows GlassCard's
        // price/timestamp row (a pre-existing GlassCard limitation — see
        // task report). Full width is also the more realistic single-column
        // feed presentation.
        OzGlassLayer(
          level: GlassLevel.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GlassCard(ad: inStock, onTap: () {}, onFavorite: () {}),
              const SizedBox(height: 12),
              GlassCard(ad: preOrder, onTap: () {}, onFavorite: () {}),
            ],
          ),
        ),
      ],
    );
  }

  // ---- 5. Кнопки и чипы --------------------------------------------------

  Widget _buttonsSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Кнопки и чипы'),
          GlassButton(label: 'Продолжить', onPressed: () {}),
          const SizedBox(height: 12),
          const GlassButton(label: 'Недоступно'),
          const SizedBox(height: 12),
          GlassButton(label: 'Подробнее', filled: false, onPressed: () {}),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GlassChip(
                label: 'Все',
                selected: _chipIndex == 0,
                onTap: () => setState(() => _chipIndex = 0),
              ),
              GlassChip(
                label: 'Бишкек',
                selected: _chipIndex == 1,
                onTap: () => setState(() => _chipIndex = 1),
              ),
              GlassChip(
                label: 'Ош',
                selected: _chipIndex == 2,
                onTap: () => setState(() => _chipIndex = 2),
              ),
              GlassChip(
                label: 'Под заказ',
                selected: _chipIndex == 3,
                onTap: () => setState(() => _chipIndex = 3),
              ),
            ],
          ),
        ],
      );

  // ---- 6. Поиск -----------------------------------------------------------

  Widget _searchSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Поиск'),
          GlassSearchBar(placeholder: 'Марка, модель, год', onSubmitted: (_) {}),
          const SizedBox(height: 12),
          const GlassSearchBar(placeholder: 'Поиск недоступен', enabled: false),
        ],
      );

  // ---- 7. Шит --------------------------------------------------------------

  Widget _sheetSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Шит'),
          GlassButton(
            label: 'Открыть шит',
            filled: false,
            onPressed: () => showGlassSheet(
              context,
              child: const _SheetDemo(),
            ),
          ),
        ],
      );

  // ---- 8. Состояния --------------------------------------------------------

  Widget _statesSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Состояния'),
          const ShimmerCard(height: 120),
          const SizedBox(height: 16),
          const EmptyState(
            icon: CupertinoIcons.heart,
            title: 'Пока пусто',
            subtitle: 'Сохранённые объявления появятся здесь',
          ),
          const SizedBox(height: 16),
          ErrorRetry(error: 'x', onRetry: () {}),
        ],
      );
}

class _Swatch {
  const _Swatch(this.name, this.color);
  final String name;
  final Color color;
}

/// Small mono uppercase section label used to introduce every gallery
/// section.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Menlo',
            fontSize: 13,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: OzColors.inkSoft.resolveFrom(context),
          ),
        ),
      );
}

/// Body of the demo sheet opened from the "Шит" section — proves the
/// grabber handle and glass chrome of [showGlassSheet].
class _SheetDemo extends StatelessWidget {
  const _SheetDemo();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: OzDims.padL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('О дизайн-системе', style: OzText.title(context)),
            const SizedBox(height: 12),
            Text(
              'Этот шит открывается поверх экрана в стекле уровня chrome, '
              'с ручкой-грабером сверху и произвольным высотным фактором.',
              style: OzText.body(context),
            ),
            const SizedBox(height: 12),
            Text(
              'Контент может быть любым — форма, список фильтров, детали '
              'объявления.',
              style: OzText.body(context),
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
}
