import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionOverviewState {}

class CollectionOverviewStateLoadedData extends CollectionOverviewState {
  final List<CollectionItemModel> collectionList;

  CollectionOverviewStateLoadedData({required this.collectionList});

  factory CollectionOverviewStateLoadedData.demo() =>
      CollectionOverviewStateLoadedData(
        collectionList: [
          CollectionItemModel(
            collectionName: 'Moon',
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
          CollectionItemModel(
            collectionName: 'Galaxies',
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
}
