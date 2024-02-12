import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

part 'collection_item_model.freezed.dart';
part 'collection_item_model.g.dart';

@freezed
class CollectionItemModel with _$CollectionItemModel {
  const factory CollectionItemModel({
    required String collectionName,
    required PictureModel picture,
  }) = _CollectionItemModel;

  factory CollectionItemModel.fromJson(Map<String, Object?> json) =>
      _$CollectionItemModelFromJson(json);
}
