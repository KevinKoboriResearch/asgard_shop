import 'package:nasa_apod_app/services/services.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:equatable/equatable.dart';

class CollectionState extends Equatable {
  const CollectionState({
    required this.items,
  });

  final List<CollectionItem> items;

  factory CollectionState.demo() => const CollectionState(
        items: [
          CollectionItem(
            quantity: 2,
            product: Product(
              id: '002',
              image: 'https://picsum.photos/id/20/200/300',
              name: 'Viktar',
              description: 'Example ...',
              category: 'Clothes',
              price: 68,
              imageAspectRatio: 0.7,
            ),
          ),
          CollectionItem(
            quantity: 1,
            product: Product(
              id: '003',
              image: 'https://picsum.photos/id/30/200/300',
              name: 'Jvynir',
              description: 'Example ...',
              category: 'Helmets',
              price: 240,
              imageAspectRatio: 0.8,
            ),
          ),
        ],
      );

  @override
  List<Object?> get props => [items];
}

class CollectionNotifier extends ValueNotifier<CollectionState> {
  CollectionNotifier.demo() : super(CollectionState.demo());
}

class CollectionItem extends Equatable {
  const CollectionItem({
    required this.product,
    required this.quantity,
  });
  final Product product;
  final int quantity;

  @override
  List<Object?> get props => [product, quantity];
}
