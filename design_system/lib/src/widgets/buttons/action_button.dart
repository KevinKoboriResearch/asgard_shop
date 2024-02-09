import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:tap_builder/tap_builder.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state, hasFocus) {
        switch (state) {
          case TapState.hover:
            return AppActionButtonLayout.hovered(icon: icon);
          case TapState.pressed:
            return AppActionButtonLayout.pressed(icon: icon);
          default:
            return AppActionButtonLayout.inactive(icon: icon);
        }
      },
    );
  }
}

class AppActionButtonLayout extends StatelessWidget {
  const AppActionButtonLayout.inactive({
    super.key,
    required this.icon,
  }) : _state = AppButtonState.inactive;

  const AppActionButtonLayout.hovered({
    super.key,
    required this.icon,
  }) : _state = AppButtonState.hovered;

  const AppActionButtonLayout.pressed({
    super.key,
    required this.icon,
  }) : _state = AppButtonState.pressed;

  final String icon;
  final AppButtonState _state;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    switch (_state) {
      case AppButtonState.hovered:
        return AppButtonLayout.hovered(
          icon: icon,
          hoveredBackgroundColor: theme.colors.accentOpposite.withOpacity(0.15),
        );
      case AppButtonState.pressed:
        return AppButtonLayout.pressed(
          icon: icon,
          pressedBackgroundColor: theme.colors.accentOpposite.withOpacity(0.20),
        );
      case AppButtonState.inactive:
        return AppButtonLayout.inactive(
          icon: icon,
          inactiveBackgroundColor: theme.colors.accentOpposite.withOpacity(0),
        );
    }
  }
}
