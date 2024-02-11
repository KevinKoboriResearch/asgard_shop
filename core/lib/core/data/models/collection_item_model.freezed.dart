// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollectionItemModel _$CollectionItemModelFromJson(Map<String, dynamic> json) {
  return _CollectionItemModel.fromJson(json);
}

/// @nodoc
mixin _$CollectionItemModel {
  String get collectionName => throw _privateConstructorUsedError;
  PictureModel get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectionItemModelCopyWith<CollectionItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionItemModelCopyWith<$Res> {
  factory $CollectionItemModelCopyWith(
          CollectionItemModel value, $Res Function(CollectionItemModel) then) =
      _$CollectionItemModelCopyWithImpl<$Res, CollectionItemModel>;
  @useResult
  $Res call({String collectionName, PictureModel picture});

  $PictureModelCopyWith<$Res> get picture;
}

/// @nodoc
class _$CollectionItemModelCopyWithImpl<$Res, $Val extends CollectionItemModel>
    implements $CollectionItemModelCopyWith<$Res> {
  _$CollectionItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? picture = null,
  }) {
    return _then(_value.copyWith(
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as PictureModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PictureModelCopyWith<$Res> get picture {
    return $PictureModelCopyWith<$Res>(_value.picture, (value) {
      return _then(_value.copyWith(picture: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionItemModelImplCopyWith<$Res>
    implements $CollectionItemModelCopyWith<$Res> {
  factory _$$CollectionItemModelImplCopyWith(_$CollectionItemModelImpl value,
          $Res Function(_$CollectionItemModelImpl) then) =
      __$$CollectionItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collectionName, PictureModel picture});

  @override
  $PictureModelCopyWith<$Res> get picture;
}

/// @nodoc
class __$$CollectionItemModelImplCopyWithImpl<$Res>
    extends _$CollectionItemModelCopyWithImpl<$Res, _$CollectionItemModelImpl>
    implements _$$CollectionItemModelImplCopyWith<$Res> {
  __$$CollectionItemModelImplCopyWithImpl(_$CollectionItemModelImpl _value,
      $Res Function(_$CollectionItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = null,
    Object? picture = null,
  }) {
    return _then(_$CollectionItemModelImpl(
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as PictureModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionItemModelImpl implements _CollectionItemModel {
  const _$CollectionItemModelImpl(
      {required this.collectionName, required this.picture});

  factory _$CollectionItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionItemModelImplFromJson(json);

  @override
  final String collectionName;
  @override
  final PictureModel picture;

  @override
  String toString() {
    return 'CollectionItemModel(collectionName: $collectionName, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionItemModelImpl &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, collectionName, picture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionItemModelImplCopyWith<_$CollectionItemModelImpl> get copyWith =>
      __$$CollectionItemModelImplCopyWithImpl<_$CollectionItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionItemModelImplToJson(
      this,
    );
  }
}

abstract class _CollectionItemModel implements CollectionItemModel {
  const factory _CollectionItemModel(
      {required final String collectionName,
      required final PictureModel picture}) = _$CollectionItemModelImpl;

  factory _CollectionItemModel.fromJson(Map<String, dynamic> json) =
      _$CollectionItemModelImpl.fromJson;

  @override
  String get collectionName;
  @override
  PictureModel get picture;
  @override
  @JsonKey(ignore: true)
  _$$CollectionItemModelImplCopyWith<_$CollectionItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
