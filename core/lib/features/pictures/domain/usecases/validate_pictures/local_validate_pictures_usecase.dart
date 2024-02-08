import 'package:dartz/dartz.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

mixin LocalValidatePicturesUseCase
    implements UseCase<DomainFailure, void, void> {
  @override
  Future<Either<DomainFailure, void>> call(void _);
}
