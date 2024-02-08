import 'package:nasa_apod_core/nasa_apod_core.dart';

PicturesPagePresenter picturesPresenterFactory() => PicturesPageCubit(
    loadLastTenDaysPicturesByDate:
        remoteLoadPicturesUseCaseWithLocalFallbackFactory());
