import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:equatable/equatable.dart';

class CollectionState extends Equatable {
  const CollectionState({
    required this.items,
  });

  final List<CollectionItem> items;

  factory CollectionState.demo() => CollectionState(
        items: [
          CollectionItem(
            quantity: 2,
            picture: PictureModel(
              copyright: 'copyright',
              date: DateTime.parse('2024-01-01'),
              explanation: 'explanation',
              hdurl: 'hdurl',
              mediaType: 'mediaType',
              serviceVersion: 'serviceVersion',
              title: 'title',
              url:
                  'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
            ),
          ),
          CollectionItem(
            quantity: 1,
            picture: PictureModel(
              copyright: 'copyright',
              date: DateTime.parse('2024-01-01'),
              explanation: 'explanation',
              hdurl: 'hdurl',
              mediaType: 'mediaType',
              serviceVersion: 'serviceVersion',
              title: 'title',
              url:
                  'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
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
    required this.picture,
    required this.quantity,
  });
  final PictureModel picture;
  final int quantity;

  @override
  List<Object?> get props => [picture, quantity];
}
