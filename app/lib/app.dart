import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/base/state_provider.dart';
import 'package:nasa_apod_app/features/account/state.dart';
import 'package:nasa_apod_app/features/cart/state.dart';
// import 'package:nasa_apod_app/features/catalog/state.dart';
// import 'package:nasa_apod_app/features/pictures/presentation/ui/pictures_page/views/pictures_page_state_load_success_view.dart';
import 'package:nasa_apod_app/features/notifications/state.dart';
import 'package:nasa_apod_app/features/product_detail/view.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  // final _router = GoRouter(
  //   routes: [
  //     GoRoute(
  //         path: '/',
  //         builder: (context, state) => PicturesPage(
  //             picturesPagePresenter: picturesPagePresenterFactory())),
  //     GoRoute(
  //         path: '/detail/:pictureDate',
  //         pageBuilder: (context, state) => TransparentPage<void>(
  //             key: state.pageKey,
  //             child: PictureDetailPageStateLoadedSuccessView(
  //                 pictureDate: state.pathParameters['pictureDate']!,
  //                 pictureViewModel: state.extra as PictureViewModel))),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return
        // StateProvider<CatalogState, CatalogNotifier>(
        //   create: (context) => CatalogNotifier.demo(),
        //   child:
        ModularApp(
      module: AppModule(),
      child: StateProvider<NotificationsState, NotificationsNotifier>(
        create: (context) => NotificationsNotifier.demo(),
        child: StateProvider<CartState, CartNotifier>(
          create: (context) => CartNotifier.demo(),
          child: StateProvider<AccountState, AccountNotifier>(
            create: (context) => AccountNotifier.demo(),
            child: AppBase(
              debugShowCheckedModeBanner: false,
              colorMode: AppThemeColorMode.dark,
              appLogo: ExactAssetPicture(
                SvgPicture.svgStringDecoderBuilder,
                'assets/images/nasa_logo.svg',
              ),
              appWarmLogo: ExactAssetPicture(
                SvgPicture.svgStringDecoderBuilder,
                'assets/images/nasa_worm_logo.svg',
              ),
              // routeInformationParser: _router.routeInformationParser,
              // routerDelegate: _router.routerDelegate,
              // routeInformationProvider: _router.routeInformationProvider,
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              // routeInformationProvider: Modular.routeInformationProvider,
              // routerConfig: Modular.routerConfig,
              title: 'Nasa Apod',
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
