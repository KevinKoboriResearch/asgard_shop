import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:go_router/go_router.dart';

import '../widgets/pictures_page_header.dart';
import '../widgets/pictures_page_navigation_bar.dart';

class PicturesPageStateLoadedSuccessView extends StatelessWidget {
  const PicturesPageStateLoadedSuccessView({
    super.key,
    required this.presenter,
    required this.pictureViewModelList,
  });

  final PicturesPagePresenter presenter;
  final List<PictureViewModel> pictureViewModelList;

  @override
  Widget build(BuildContext context) {
    return CatalogMobileLayout(
      pictureViewModelList: pictureViewModelList,
      onViewProduct: (pictureDate) {
        context.push('/detail/$pictureDate');
      },
    );
  }
}

/// State dependencies :
/// * [CatalogState]
/// * [AccountState]
/// * [NotificationsState]
/// * [CartState]
class CatalogMobileLayout extends StatelessWidget {
  const CatalogMobileLayout({
    super.key,
    required this.pictureViewModelList,
    required this.onViewProduct,
  });

  final List<PictureViewModel> pictureViewModelList;
  final ValueChanged<String> onViewProduct;

  @override
  Widget build(BuildContext context) {
    // final products = context.select((CatalogState state) => state.products);
    return AppScaffold(
      body: _BodyWithProducts(
        // products: products,
        pictureViewModelList: pictureViewModelList,
        onViewProduct: onViewProduct,
      ),
      floatingBar: const PicturesPageNavigationBar(),
    );
  }
}

class _BodyWithProducts extends StatefulWidget {
  const _BodyWithProducts({
    super.key,
    required this.pictureViewModelList,
    required this.onViewProduct,
  });

  final List<PictureViewModel> pictureViewModelList;
  final ValueChanged<String> onViewProduct;

  @override
  State<_BodyWithProducts> createState() => _BodyWithProductsState();
}

class _BodyWithProductsState extends State<_BodyWithProducts> {
  late final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: PicturesPageHeader(
              controller: _controller,
              image: CachedNetworkImageProvider(
                  widget.pictureViewModelList[1].url),
            ),
          ),
          SliverToBoxAdapter(
            child: AppPadding(
              padding: const AppEdgeInsets.only(
                left: AppGapSize.large,
                top: AppGapSize.large,
                right: AppGapSize.large,
                bottom: AppGapSize.none,
              ),
              child: Stack(
                children: [
                  PictureTile(
                    key: Key(widget.pictureViewModelList[0].date), // .id
                    title: widget.pictureViewModelList[0].title,
                    imageUrl: widget.pictureViewModelList[0].url,
                    // CachedNetworkImageProvider(widget.pictureViewModelList[0].url),
                    // CachedNetworkImageProvider(widget.pictureViewModelList[0].url),
                    // CachedNetworkImageProvider(product.image),
                    date: widget.pictureViewModelList[0].date,
                    // aspectRatio: widget.pictureViewModelList[0].aspectRatio,
                    onTap: () => widget
                        .onViewProduct(widget.pictureViewModelList[0].date),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      margin: AppEdgeInsets.semiSmall().toEdgeInsets(theme),
                      height: theme.typography.title1.fontSize! * 1.3,
                      width: theme.typography.title1.fontSize! * 1.3,
                      alignment: Alignment.centerLeft,
                      child: SvgPicture(theme.images.appLogo),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AppPadding(
              padding: const AppEdgeInsets.only(
                left: AppGapSize.large,
                top: AppGapSize.large,
                right: AppGapSize.large,
                bottom: AppGapSize.none,
              ),
              child: AppText.title1('Discover Now'),
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: AppTileSliverGrid(
              padding: EdgeInsets.only(
                left: theme.spacing.large,
                top: theme.spacing.extraSmall,
                right: theme.spacing.large,
                bottom: math.max(
                  mediaQuery.padding.bottom,
                  theme.spacing.large,
                ),
              ),
              crossAxisCount: (constraints.maxWidth / 300).ceil(),
              children: [
                ...widget.pictureViewModelList.skip(1).map(
                      (pictureViewModel) => PictureTile(
                        key: Key(pictureViewModel.date), // .id
                        title: pictureViewModel.title,
                        imageUrl: pictureViewModel.url,
                        // CachedNetworkImageProvider(pictureViewModel.url),
                        // CachedNetworkImageProvider(pictureViewModel.url),
                        // CachedNetworkImageProvider(product.image),
                        date: pictureViewModel.date,
                        // aspectRatio: pictureViewModel.aspectRatio,
                        onTap: () =>
                            widget.onViewProduct(pictureViewModel.date),
                      ),
                    ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
