import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_app/services/services.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'state.dart';
import 'widgets/header.dart';
import 'widgets/navigation_bar.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({
    Key? key,
    required this.presenter,
    required this.pictureViewModelList,
  }) : super(key: key);

  final PicturesPagePresenter presenter;
  final List<PictureViewModel> pictureViewModelList;

  @override
  Widget build(BuildContext context) {
    return CatalogMobileLayout(
      pictureViewModelList: pictureViewModelList,
      onViewProduct: (productId) {
        context.push('/detail/$productId');
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
    Key? key,
    required this.pictureViewModelList,
    required this.onViewProduct,
  }) : super(key: key);

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
      floatingBar: const CatalogNavigationBar(),
    );
  }
}

class _BodyWithProducts extends StatefulWidget {
  const _BodyWithProducts({
    Key? key,
    required this.pictureViewModelList,
    required this.onViewProduct,
  }) : super(key: key);

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
            child: CatalogHeader(
              controller: _controller,
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: AppTileSliverGrid(
              padding: EdgeInsets.only(
                left: theme.spacing.semiBig,
                top: theme.spacing.semiBig,
                right: theme.spacing.semiBig,
                bottom: math.max(
                  mediaQuery.padding.bottom,
                  theme.spacing.semiBig,
                ),
              ),
              crossAxisCount: (constraints.maxWidth / 200).ceil(),
              children: [
                ...widget.pictureViewModelList.map(
                  (pictureViewModel) => ProductTile(
                    key: Key(pictureViewModel.date), // .id
                    name: pictureViewModel.title,
                    image: 
                    NetworkImage(pictureViewModel.url),
                    // CachedNetworkImageProvider(pictureViewModel.url),
                    // NetworkImage(product.image),
                    price: pictureViewModel.explanation,
                    aspectRatio: 1,//pictureViewModel.aspectRatio,
                    onTap: () => widget.onViewProduct(pictureViewModel.date),
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
