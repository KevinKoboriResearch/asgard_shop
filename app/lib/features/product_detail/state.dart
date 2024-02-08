import 'package:nasa_apod_app/services/services.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:equatable/equatable.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.product,
  });

  final Product? product;

  @override
  List<Object?> get props => [product];
}

class ProductDetailNotifier extends ValueNotifier<ProductDetailState> {
  ProductDetailNotifier(ProductDetailState initialState) : super(initialState);
}
