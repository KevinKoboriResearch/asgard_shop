import 'package:cached_network_image/cached_network_image.dart';
import 'package:nasa_apod_app/base/state_provider.dart';
import 'package:nasa_apod_app/features/product_detail/state.dart';
import 'package:nasa_apod_app/services/services.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:provider/provider.dart';

import 'widgets/navigation_bar.dart';

class PictureDetailPageStateLoadedSuccessView extends StatelessWidget {
  const PictureDetailPageStateLoadedSuccessView({
    super.key,
    required this.pictureDate,
    this.pictureViewModel,
  });

  final String pictureDate;
  final PictureViewModel? pictureViewModel;

  @override
  Widget build(BuildContext context) {
    return
        // StateProvider<ProductDetailState, ProductDetailNotifier>(
        //   create: (context) {
        //     final product = context.read<CatalogState>().getProduct(productId);
        //     return ProductDetailNotifier(
        //       ProductDetailState(
        //         product: pictureViewModel,
        //       ),
        //     );
        //   },
        //   child: const

        // );
        ProductDetailLayout(pictureViewModel: pictureViewModel);
  }
}

/// State dependencies :
/// * [ProductDetailState]
/// * [AccountState]
/// * [NotificationsState]
/// * [CartState]
class ProductDetailLayout extends StatelessWidget {
  const ProductDetailLayout({
    super.key,
    this.pictureViewModel,
  });

  final PictureViewModel? pictureViewModel;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    // final product = context.select((ProductDetailState state) => state.product);

    return AppScaffold(
      floatingBar: const ProductDetailNavigationBar(),
      backgroundColor: theme.colors.background.withAlpha(0),
      body: AppContentSheet(
        children: [
          if (pictureViewModel == null) const AppText.title2('Not found'),
          if (pictureViewModel != null)
            ..._buildBody(context, theme, pictureViewModel!),
        ],
      ),
    );
  }

  List<Widget> _buildBody(
      BuildContext context, AppThemeData theme, PictureViewModel product) {
    return [
      ClipRRect(
        borderRadius: theme.radius.asBorderRadius().regular,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              product.url,
            ),
          ),
        ),
      ),
      AppText.title1(product.title),
      AppText.title3(
        product.date,
        color: theme.colors.accent,
      ),
      AppText.paragraph1(product.explanation),
      const SizedBox(
        height: 100,
      ),
    ];
  }
}
