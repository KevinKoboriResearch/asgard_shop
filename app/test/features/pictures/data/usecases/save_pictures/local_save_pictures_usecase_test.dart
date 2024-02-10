import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  late LocalSavePicturesUseCase sut;
  late LocalStorageSpy localStorage;
  late String itemKey;

  setUp(() {
    localStorage = LocalStorageSpy();
    itemKey = 'pictures_list';
    sut = LocalSavePicturesUseCaseImpl(
      localStorage: localStorage,
      itemKey: itemKey,
    );
  });

  group('Saving', () {
    test('When save data should call localStorage with correct values',
        () async {
      final data = DeviceLocalStorageFactory().generateValidPictureJsonList();
      final picturesJsonList = data;

      localStorage.mockSaveSuccess();

      await PictureMapper.fromJsonListToEntityList(picturesJsonList).fold(
        (domainFailure) {},
        (pictureEntityList) async {
          final result = await sut.call(pictureEntityList);
          return result.fold(
            (domainFailure) {},
            (_) {},
          );
        },
      );

      verify(() => localStorage.save(
              itemKey: 'pictures_list',
              itemValue: any<dynamic>(named: 'itemValue')))
          .called(1); // TODO(all): NOW - CHANGE EXPECTED VALUE
    });

    test('When save data should throw UnexpectedFailure if save throws',
        () async {
      final picturesJsonList =
          DeviceLocalStorageFactory().generateValidPictureJsonList();

      localStorage.mockSaveFailure(LocalStorageFailure.unknownError);

      late final List<PictureEntity> matcher;

      PictureMapper.fromJsonListToEntityList(picturesJsonList).fold(
        (domainFailure) {},
        (pictureEntityList) {
          matcher = pictureEntityList;
        },
      );

      final result = await sut.call(matcher);

      final actual = result.fold(
        (domainFailure) => domainFailure,
        (_) {},
      );

      expect(
          actual,
          predicate((element) =>
              element is DomainFailure &&
              element == DomainFailure.unexpected &&
              element == DomainFailure.unexpected));
    });
  });
}
