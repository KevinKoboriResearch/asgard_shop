import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: BlocProvider(
        create: (context) => NotificationsOverviewBloc(),
        child: BlocProvider(
          create: (context) => CollectionOverviewBloc(),
          child: BlocProvider(
            create: (context) => AccountOverviewBloc(),
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
