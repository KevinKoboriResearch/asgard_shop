import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

StatefulWidget pictureDetailPageFactory({
  required double aspectRatio,
  required String pictureDate,
  PictureViewModel? pictureViewModel,
}) =>
    PictureDetailPage(
      aspectRatio: aspectRatio,
      pictureDate: pictureDate,
      pictureViewModel: pictureViewModel,
    );
