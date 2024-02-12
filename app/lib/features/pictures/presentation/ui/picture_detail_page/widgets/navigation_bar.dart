import 'package:nasa_apod_app/features/account/widget/avatar.dart';
import 'package:nasa_apod_app/features/collection/ui/widget/overview.dart';
import 'package:nasa_apod_app/features/notifications/widgets/notification_bar.dart';
import 'package:nasa_apod_app/features/pictures/presentation/ui/pictures_page/widgets/navigation_bar.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PictureDetailNavigationBar extends StatelessWidget {
  final AccountOverviewBloc accountOverviewPresenter;
  final CollectionOverviewBloc collectionOverviewPresenter;
  final NotificationsOverviewBloc notificationsOverviewPresenter;

  const PictureDetailNavigationBar({
    required this.accountOverviewPresenter,
    required this.collectionOverviewPresenter,
    required this.notificationsOverviewPresenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final route = ModalRoute.of(context);
    return NotificationBar(
      notificationsOverviewPresenter: notificationsOverviewPresenter,
      child: AppNavigationBar(
        animation: route?.animation,
        canNavigateBack: true,
        leading: CurrentUserAvatar(
          accountOverviewPresenter: accountOverviewPresenter,
        ),
        summary: CollectionOverview(
          collectionOverviewPresenter: collectionOverviewPresenter,
        ),
        body: CurrentUserAccountNavigationBody(
          accountOverviewPresenter: accountOverviewPresenter,
        ),
        action: AppButton(
          // TODO: NOW - CHANGE THIS NAME
          icon: theme.icons.characters.addPicture,
          title: 'Add to collections',
          onTap: () {},
        ),
      ),
    );
  }
}
