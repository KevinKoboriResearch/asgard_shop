import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  late LocalLoadLastTenDaysPicturesByDateUseCase sut;
  late LocalStorageSpy localStorage;
  late String itemKey;

  setUp(() {
    localStorage = LocalStorageSpy();
    itemKey = 'pictures_list';
    sut = LocalLoadLastTenDaysPicturesByDateUseCaseImpl(
      localStorage: localStorage,
      itemKey: itemKey,
    );
  });

  group('Loading', () {
    test('When load data should call localStorage with correct key', () async {
      final data = DeviceLocalStorageFactory().generateValidPictureJsonList();
      localStorage.mockFetchSuccess(data);

      await sut.call(null);

      verify(() => localStorage.fetch('pictures_list')).called(1);
    });

    test('When load data should return a list of pictures on success',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureJsonList();
      final picturesJsonList = data;
      late final List<PictureEntity> matcher;
      PictureMapper.fromJsonListToEntityList(picturesJsonList).fold(
        (domainFailure) {},
        (pictureEntityList) {
          matcher = pictureEntityList;
        },
      );

      localStorage.mockFetchSuccess(data);

      late List<PictureEntity> actual;
      final resultSUT = await sut.call(null);
      resultSUT.fold(
        (domainFailure) {},
        (pictureEntityList) {
          actual = pictureEntityList;
        },
      );

      expect(actual, matcher);
    });

    test(
        'When load data should throw UnexpectedFailure if localStorage is empty',
        () async {
      localStorage.mockFetchSuccess(<Map<String, dynamic>>[]);

      final result = await sut.call(null);

      final actual = result.fold(
        (domainFailure) => domainFailure,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.unexpected),
      );
    });

    test(
        'When load data should throw UnexpectedFailure if localStorage is isvalid',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateInvalidPictureJsonList());

      final result = await sut.call(null);

      final actual = result.fold(
        (domainFailure) => domainFailure,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.unexpected),
      );
    });

    test(
        'When load data should throw UnexpectedFailure if localStorage is incomplete',
        () async {
      localStorage.mockFetchSuccess(
          DeviceLocalStorageFactory().generateIncompletePictureJsonList());

      final result = await sut.call(null);

      final actual = result.fold(
        (domainFailure) => domainFailure,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.unexpected),
      );
    });

    test('When load data should throw UnexpectedFailure if localStorage throws',
        () async {
      localStorage.mockFetchFailure(LocalStorageFailure.unknownError);

      final result = await sut.call(null);

      final actual = result.fold(
        (domainFailure) => domainFailure,
        (pictureEntityList) => pictureEntityList,
      );

      expect(
        actual,
        predicate((element) =>
            element is DomainFailure && element == DomainFailure.unexpected),
      );
    });
  });
}
