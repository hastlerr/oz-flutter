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
import '../../../core/widgets/glass_nav_bar.dart';
import '../../../core/widgets/glass_surface.dart';
import '../../../core/widgets/glass_tab_bar.dart';
import '../../../core/widgets/oz_button.dart';
import '../../../core/widgets/oz_card.dart';
import '../../../core/widgets/oz_chip.dart';
import '../../../core/widgets/oz_scaffold.dart';
import '../../../core/widgets/oz_search_bar.dart';
import '../../../core/widgets/oz_sheet.dart';
import '../../../core/widgets/oz_surface.dart';
import '../../../core/widgets/shimmer_card.dart';

/// Debug/witness screen presenting every kit component in one place — the
/// "component gallery" the design system is judged by. Not part of the
/// user-facing app flow.
///
/// Warm minimalism: glass is reserved for [GlassTabBar]/[GlassNavBar] — the
/// floating chrome, exactly where iOS itself puts glass. Everything else
/// (cards, buttons, chips, search, sheets) is a plain opaque [OzSurface] —
/// content is the hero, chrome recedes.
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
  Widget build(BuildContext context) => OzScaffold(
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
        // OzScaffold now reserves top/bottom MediaQuery padding for the
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
              _chromeSection(context),
              const SizedBox(height: 28),
              _surfacesSection(context),
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
      _Swatch('surface', OzColors.surface.resolveFrom(context)),
      _Swatch('ink', OzColors.ink.resolveFrom(context)),
      _Swatch('inkSoft', OzColors.inkSoft.resolveFrom(context)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Палитра'),
        Wrap(
          spacing: 4,
          runSpacing: 12,
          children: [
            for (final s in swatches)
              SizedBox(
                // Fixed width so a caption wider than the 44pt swatch (e.g.
                // "inkSoft") can't push this row past the screen edge.
                width: 56,
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

  // ---- 3. Хром ------------------------------------------------------------

  /// Glass, kept small and honest: the design pivot rejected an all-glass
  /// look ("слишком ликвид гласс") in favor of warm minimalism, where glass
  /// is reserved for exactly the chrome iOS itself renders in glass —
  /// [GlassTabBar] and [GlassNavBar] once scrolled. Everything else in this
  /// gallery below is a solid [OzSurface].
  Widget _chromeSection(BuildContext context) {
    final accent = OzColors.accent.resolveFrom(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Хром'),
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
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GlassSurface(
                  level: GlassLevel.chrome,
                  child: SizedBox(
                    height: 64,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'стекло — только таб-бар и нав-бар',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Menlo',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: OzColors.ink.resolveFrom(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---- 4. Поверхности -------------------------------------------------

  /// The solid counterpart to the glass strip above — every non-chrome
  /// component in this gallery builds on one of these three [OzSurface]
  /// configurations.
  Widget _surfacesSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Поверхности'),
          Row(
            children: [
              Expanded(child: _surfaceBlock(context, 'plain')),
              const SizedBox(width: 12),
              Expanded(
                child: _surfaceBlock(context, 'bordered', bordered: true),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _surfaceBlock(context, 'shadowed', shadowed: true),
              ),
            ],
          ),
        ],
      );

  Widget _surfaceBlock(
    BuildContext context,
    String name, {
    bool bordered = false,
    bool shadowed = false,
  }) =>
      OzSurface(
        bordered: bordered,
        shadowed: shadowed,
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

  // ---- 5. Карточка объявления -------------------------------------------

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
        // Stacked full-width (not a 2-up Row): the more realistic
        // single-column feed presentation for this screen's ~360pt content
        // width. (OzCard's price/timestamp row is Flexible/FittedBox-based
        // and stays overflow-free even much narrower than that, e.g. a
        // future 2-up grid — see its widget tests.)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OzCard(ad: inStock, onTap: () {}, onFavorite: () {}),
            const SizedBox(height: 12),
            OzCard(ad: preOrder, onTap: () {}, onFavorite: () {}),
          ],
        ),
      ],
    );
  }

  // ---- 6. Кнопки и чипы --------------------------------------------------

  Widget _buttonsSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Кнопки и чипы'),
          OzButton(label: 'Продолжить', onPressed: () {}),
          const SizedBox(height: 12),
          const OzButton(label: 'Недоступно'),
          const SizedBox(height: 12),
          OzButton(label: 'Подробнее', filled: false, onPressed: () {}),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OzChip(
                label: 'Все',
                selected: _chipIndex == 0,
                onTap: () => setState(() => _chipIndex = 0),
              ),
              OzChip(
                label: 'Бишкек',
                selected: _chipIndex == 1,
                onTap: () => setState(() => _chipIndex = 1),
              ),
              OzChip(
                label: 'Ош',
                selected: _chipIndex == 2,
                onTap: () => setState(() => _chipIndex = 2),
              ),
              OzChip(
                label: 'Под заказ',
                selected: _chipIndex == 3,
                onTap: () => setState(() => _chipIndex = 3),
              ),
            ],
          ),
        ],
      );

  // ---- 7. Поиск -----------------------------------------------------------

  Widget _searchSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Поиск'),
          OzSearchBar(placeholder: 'Марка, модель, год', onSubmitted: (_) {}),
          const SizedBox(height: 12),
          const OzSearchBar(placeholder: 'Поиск недоступен', enabled: false),
        ],
      );

  // ---- 8. Шит --------------------------------------------------------------

  Widget _sheetSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('Шит'),
          OzButton(
            label: 'Открыть шит',
            filled: false,
            onPressed: () => showOzSheet(
              context,
              child: const _SheetDemo(),
            ),
          ),
        ],
      );

  // ---- 9. Состояния --------------------------------------------------------

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
/// grabber handle and solid opaque surface of [showOzSheet].
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
              'Этот шит открывается поверх экрана на сплошной непрозрачной '
              'поверхности, с ручкой-грабером сверху и произвольным '
              'высотным фактором.',
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
