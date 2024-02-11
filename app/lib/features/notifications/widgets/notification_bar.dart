import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class NotificationBar extends StatelessWidget {
  const NotificationBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return BlocBuilder<NotificationsOverviewBloc, NotificationsOverviewState>(
      builder: (context, state) {
        if (state is NotificationsOverviewStateLoadedData) {
          return AppNotifiableBar(
            onClosed: () => BlocProvider.of<NotificationsOverviewBloc>(context)
                .add(NotificationsOverviewEventClose(null)),
            notification: state.lastNotification != null
                ? AppNotification(
                    title: state.lastNotification!.title,
                    description: state.lastNotification!.description,
                    icon: () {
                      switch (state.lastNotification!.type) {
                        case NotificationType.offer:
                          return theme.icons.characters.tag;
                      }
                    }())
                : null,
            child: child,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
