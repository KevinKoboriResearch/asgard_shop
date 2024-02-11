// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionItemModelImpl _$$CollectionItemModelImplFromJson(Map json) =>
    _$CollectionItemModelImpl(
      collectionName: json['collectionName'] as String,
      picture: PictureModel.fromJson(
          Map<String, Object?>.from(json['picture'] as Map)),
    );

Map<String, dynamic> _$$CollectionItemModelImplToJson(
        _$CollectionItemModelImpl instance) =>
    <String, dynamic>{
      'collectionName': instance.collectionName,
      'picture': instance.picture.toJson(),
    };
