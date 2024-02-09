import 'package:nasa_apod_app/features/notifications/state.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:provider/provider.dart';

class NotificationBar extends StatelessWidget {
  const NotificationBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final state =
        context.select((NotificationsState state) => state.lastNotification);
    return AppNotifiableBar(
      onClosed: () => context.read<NotificationsNotifier>().close(),
      notification: state != null
          ? AppNotification(
              title: state.title,
              description: state.description,
              icon: () {
                switch (state.type) {
                  case NotificationType.offer:
                    return theme.icons.characters.tag;
                }
              }())
          : null,
      child: child,
    );
  }
}
