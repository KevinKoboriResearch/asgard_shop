import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/src/theme/data/form_factor.dart';
import 'package:nasa_apod_design_system/src/theme/data/images.dart';
import 'package:nasa_apod_design_system/src/theme/data/typography.dart';
import 'package:nasa_apod_design_system/src/theme/theme.dart';

enum AppThemeColorMode {
  light,
  dark,
  highContrast,
}

/// Updates automatically the [AppTheme] regarding the current [MediaQuery],
/// as soon as the [theme] isn't overriden.
class AppResponsiveTheme extends StatelessWidget {
  const AppResponsiveTheme({
    required this.appLogo,
    required this.child,
    required this.appWarmLogo,
    super.key,
    this.darkAppLogo,
    this.darkAppWarmLogo,
    this.colorMode,
    this.formFactor,
  });

  final AppThemeColorMode? colorMode;
  final AppFormFactor? formFactor;
  final Widget child;
  final PictureProvider appLogo;
  final PictureProvider? darkAppLogo;
  final PictureProvider appWarmLogo;
  final PictureProvider? darkAppWarmLogo;

  static AppThemeColorMode colorModeOf(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkTheme = platformBrightness == ui.Brightness.dark;
    if (useDarkTheme) {
      return AppThemeColorMode.dark;
    }
    final highContrast = MediaQuery.highContrastOf(context);
    if (highContrast) {
      return AppThemeColorMode.highContrast;
    }

    return AppThemeColorMode.light;
  }

  static AppFormFactor formFactorOf(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.size.width < 200) {
      return AppFormFactor.small;
    }

    return AppFormFactor.medium;
  }

  @override
  Widget build(BuildContext context) {
    var theme = AppThemeData.regular(
      appLogo: appLogo,
      appWarmLogo: appWarmLogo,
    );

    /// Updating the colors for the current brightness
    final colorMode = this.colorMode ?? colorModeOf(context);
    switch (colorMode) {
      case AppThemeColorMode.dark:
        theme = theme.withColors(AppColorsData.dark());

        final darkAppLogo = this.darkAppLogo;
        if (darkAppLogo != null) {
          theme = theme.withImages(theme.images.withAppLogo(darkAppLogo));
        }
        break;
      case AppThemeColorMode.highContrast:
        theme = theme.withColors(AppColorsData.highContrast());
        theme = theme.withImages(
          AppImagesData.highContrast(
            appLogo: theme.images.appLogo,
            appWarmLogo: theme.images.appWarmLogo,
          ),
        );
        break;
      case AppThemeColorMode.light:
        break;
    }

    // Updating the sizes for current form factor.
    final formFactor = this.formFactor ?? formFactorOf(context);
    theme = theme.withFormFactor(formFactor);
    if (formFactor == AppFormFactor.small) {
      theme = theme.withTypography(AppTypographyData.small());
    }

    return AppTheme(
      data: theme,
      child: child,
    );
  }
}
