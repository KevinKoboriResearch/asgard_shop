import 'package:nasa_apod_design_system/src/helpers/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppRadiusData extends Equatable {
  const AppRadiusData({
    required this.extraSmall,
    required this.small,
    required this.regular,
    required this.big,
  });

  const AppRadiusData.regular()
      : extraSmall = const Radius.circular(5),
        small = const Radius.circular(10),
        regular = const Radius.circular(12),
        big = const Radius.circular(16);

  final Radius extraSmall;
  final Radius small;
  final Radius regular;
  final Radius big;

  AppBorderRadiusData asBorderRadius() => AppBorderRadiusData(this);

  @override
  List<Object?> get props => [
        extraSmall.named('extraSmall'),
        small.named('small'),
        regular.named('regular'),
        big.named('big'),
      ];
}

class AppBorderRadiusData extends Equatable {
  const AppBorderRadiusData(this._radius);

  BorderRadius get extraSmall => BorderRadius.all(_radius.extraSmall);
  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.regular);
  BorderRadius get big => BorderRadius.all(_radius.big);

  final AppRadiusData _radius;

  @override
  List<Object?> get props => [_radius];
}
