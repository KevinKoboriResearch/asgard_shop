import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/base/state_provider.dart';
import 'package:nasa_apod_app/features/account/state.dart';
import 'package:nasa_apod_app/features/collection/state.dart';
import 'package:nasa_apod_app/features/notifications/state.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: StateProvider<NotificationsState, NotificationsNotifier>(
        create: (context) => NotificationsNotifier.demo(),
        child: StateProvider<CollectionState, CollectionNotifier>(
          create: (context) => CollectionNotifier.demo(),
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
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              title: 'Nasa Apod',
            ),
          ),
        ),
      ),
    );
  }
}
