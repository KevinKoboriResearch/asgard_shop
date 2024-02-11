import 'package:nasa_apod_app/features/account/state.dart';
import 'package:nasa_apod_app/features/collection/presenter/overview_state.dart';
import 'package:nasa_apod_app/features/pictures/presentation/ui/pictures_page/views/state_loaded_success_view.dart';
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
        Provider.value(value: CollectionState.demo()),
        // Provider.value(value: CatalogState.demo()),
      ],
      child: CatalogMobileLayout(
        pictureViewModelList: [],
        onViewPictureDetail: (aspectRatio, pictureViewModel) {},
        onLoadAllPicturesList: () {},
        onLoadPictureByDate: (date) {},
      ),
    ),
  );
}
