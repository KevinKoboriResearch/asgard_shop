import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class CollectionOverviewEvent {}

class CollectionOverviewEventUpdateData extends CollectionOverviewEvent {
  final List<CollectionItemModel> collectionList;
  CollectionOverviewEventUpdateData(this.collectionList);
}
