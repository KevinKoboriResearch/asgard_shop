import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// CollectionNotifier
class CollectionOverviewBloc
    extends Bloc<CollectionOverviewEvent, CollectionOverviewState> {
  CollectionOverviewBloc() : super(CollectionOverviewStateLoadedData.demo()) {
    on<CollectionOverviewEventUpdateData>((event, emit) {
      emit(CollectionOverviewStateLoadedData(items: event.newData));
    });
  }
}
