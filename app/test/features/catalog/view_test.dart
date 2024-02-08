import 'package:nasa_apod_app/features/account/state.dart';
import 'package:nasa_apod_app/features/cart/state.dart';
import 'package:nasa_apod_app/features/catalog/state.dart';
import 'package:nasa_apod_app/features/catalog/view.dart';
import 'package:nasa_apod_app/features/notifications/state.dart';
import 'package:provider/provider.dart';

import '../../base/view.dart';

void main() {
  testAppView(
    'features/catalog',
    MultiProvider(
      providers: [
        Provider.value(value: NotificationsState.demo()),
        Provider.value(value: AccountState.demo()),
        Provider.value(value: CartState.demo()),
        Provider.value(value: CatalogState.demo()),
      ],
      child: CatalogMobileLayout(
        onViewProduct: (id) {},
        pictureViewModelList: [],
      ),
    ),
  );
}
