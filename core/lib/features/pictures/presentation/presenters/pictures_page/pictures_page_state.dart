import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class PicturesPageState {}

class PicturesPageStateLoading extends PicturesPageState {}

class PicturesPageStateLoadSuccess extends PicturesPageState {
  final List<PictureViewModel>? pictureViewModelList;

  PicturesPageStateLoadSuccess(this.pictureViewModelList);
}

class PicturesPageStateLoadFailure extends PicturesPageState {
  final String failureMessage;

  PicturesPageStateLoadFailure(this.failureMessage);
}
