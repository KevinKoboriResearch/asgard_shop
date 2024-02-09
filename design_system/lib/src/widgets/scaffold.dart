import 'dart:math' as math;

import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.floatingBar,
  });

  final Widget body;
  final Color? backgroundColor;
  final Widget? floatingBar;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    final floatingBar = this.floatingBar;
    return Container(
      color: backgroundColor ?? theme.colors.background,
      child: Stack(
        children: [
          body,
          if (floatingBar != null)
            AnimatedPositioned(
              duration: theme.durations.regular,
              left: math.max(
                mediaQuery.padding.left,
                theme.spacing.semiSmall,
              ),
              right: math.max(
                mediaQuery.padding.right,
                theme.spacing.semiSmall,
              ),
              bottom: math.max(
                mediaQuery.padding.bottom,
                theme.spacing.semiSmall,
              ),
              child: floatingBar,
            ),
        ],
      ),
    );
  }
}
