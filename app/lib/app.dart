import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_apod_app/base/state_provider.dart';
import 'package:nasa_apod_app/features/account/state.dart';
import 'package:nasa_apod_app/features/cart/state.dart';
import 'package:nasa_apod_app/features/catalog/state.dart';
import 'package:nasa_apod_app/features/catalog/view.dart';
import 'package:nasa_apod_app/features/notifications/state.dart';
import 'package:nasa_apod_app/features/product_detail/view.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => PicturesPage(
                picturesPagePresenter: picturesPagePresenterFactory(),
              )
          // CatalogView(
          //   presenter: picturesPresenterFactory(),
          // ),
          ),
      GoRoute(
        path: '/detail/:id',
        pageBuilder: (context, state) => TransparentPage<void>(
          key: state.pageKey,
          child: ProductDetailView(
            productId: state.pathParameters['id']!,
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StateProvider<CatalogState, CatalogNotifier>(
      create: (context) => CatalogNotifier.demo(),
      child: StateProvider<NotificationsState, NotificationsNotifier>(
        create: (context) => NotificationsNotifier.demo(),
        child: StateProvider<CartState, CartNotifier>(
          create: (context) => CartNotifier.demo(),
          child: StateProvider<AccountState, AccountNotifier>(
            create: (context) => AccountNotifier.demo(),
            child: AppBase(
              colorMode: AppThemeColorMode.light,
              appLogo: ExactAssetPicture(
                SvgPicture.svgStringDecoderBuilder,
                'assets/images/logo.svg',
              ),
              darkAppLogo: ExactAssetPicture(
                SvgPicture.svgStringDecoderBuilder,
                'assets/images/logo_dark.svg',
              ),
              routeInformationParser: _router.routeInformationParser,
              routerDelegate: _router.routerDelegate,
              routeInformationProvider: _router.routeInformationProvider,
              title: 'Asgard',
            ),
          ),
        ),
      ),
    );
  }
}
