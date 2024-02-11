import 'package:nasa_apod_app/features/pictures/presentation/ui/pictures_page/views/state_loaded_success_view.dart';
import 'package:provider/provider.dart';

import '../../base/view.dart';

void main() {
  testAppView(
    'features/pictures',
    MultiProvider(
      providers: [
        // Provider.value(value: NotificationsState.demo()),
        // Provider.value(value: AccountState.demo()),
        // Provider.value(value: CollectionState.demo()),
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
