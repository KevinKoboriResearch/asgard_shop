import 'package:nasa_apod_design_system/src/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

enum AppGapSize {
  none,
  small,
  semiSmall,
  medium,
  semiBig,
  big,
}

extension AppGapSizeExtension on AppGapSize {
  double getSpacing(AppThemeData theme) {
    switch (this) {
      case AppGapSize.none:
        return 0;
      case AppGapSize.small:
        return theme.spacing.small;
      case AppGapSize.semiSmall:
        return theme.spacing.semiSmall;
      case AppGapSize.medium:
        return theme.spacing.regular;
      case AppGapSize.semiBig:
        return theme.spacing.semiBig;
      case AppGapSize.big:
        return theme.spacing.big;
    }
  }
}

class AppGap extends StatelessWidget {
  const AppGap(
    this.size, {
    Key? key,
  }) : super(key: key);

  const AppGap.small({
    Key? key,
  })  : size = AppGapSize.small,
        super(key: key);

  const AppGap.semiSmall({
    Key? key,
  })  : size = AppGapSize.semiSmall,
        super(key: key);

  const AppGap.medium({
    Key? key,
  })  : size = AppGapSize.medium,
        super(key: key);

  const AppGap.semiBig({
    Key? key,
  })  : size = AppGapSize.semiBig,
        super(key: key);

  const AppGap.big({
    Key? key,
  })  : size = AppGapSize.big,
        super(key: key);

  final AppGapSize size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Gap(size.getSpacing(theme));
  }
}
