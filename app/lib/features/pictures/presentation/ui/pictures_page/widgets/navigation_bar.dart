import 'package:nasa_apod_app/features/account/widget/avatar.dart';
import 'package:nasa_apod_app/features/collection/widget/overview.dart';
import 'package:nasa_apod_app/features/notifications/widgets/notification_bar.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageNavigationBar extends StatelessWidget {
  const PicturesPageNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NotificationBar(
      child: AppNavigationBar(
        leading: CurrentUserAvatar(),
        summary: CollectionOverview(),
        body: CurrentUserAccount(),
      ),
    );
  }
}

class CurrentUserAccount extends StatelessWidget {
  const CurrentUserAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText.paragraph1(
          'Account',
          color: theme.colors.actionBarForeground,
        ),
        AppText.title3(
          'John',
          color: theme.colors.actionBarForeground,
        ),
      ],
    );
  }
}
