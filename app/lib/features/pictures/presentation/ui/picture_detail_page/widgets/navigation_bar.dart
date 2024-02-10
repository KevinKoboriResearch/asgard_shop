import 'package:nasa_apod_app/features/account/widget/avatar.dart';
import 'package:nasa_apod_app/features/collection/widget/overview.dart';
import 'package:nasa_apod_app/features/pictures/presentation/ui/pictures_page/widgets/navigation_bar.dart';
import 'package:nasa_apod_app/features/notifications/widgets/notification_bar.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PictureDetailNavigationBar extends StatelessWidget {
  const PictureDetailNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final route = ModalRoute.of(context);
    return NotificationBar(
      child: AppNavigationBar(
        animation: route?.animation,
        canNavigateBack: true,
        leading: const CurrentUserAvatar(),
        body: const CurrentUserAccount(),
        summary: const CollectionOverview(),
        action: AppButton(
          icon: theme.icons.characters.addProduct,
          title: 'collections',
          onTap: () {},
        ),
      ),
    );
  }
}
