import 'package:nasa_apod_app/features/account/widget/avatar.dart';
import 'package:nasa_apod_app/features/cart/widget/overview.dart';
import 'package:nasa_apod_app/features/catalog/widgets/navigation_bar.dart';
import 'package:nasa_apod_app/features/notifications/widgets/notification_bar.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ProductDetailNavigationBar extends StatelessWidget {
  const ProductDetailNavigationBar({
    Key? key,
  }) : super(key: key);

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
        summary: const CartOverview(),
        action: AppButton(
          icon: theme.icons.characters.addProduct,
          title: 'Add to cart',
          onTap: () {},
        ),
      ),
    );
  }
}
