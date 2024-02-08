import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/features/catalog/view.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PicturesPage extends StatefulWidget {
  final PicturesPagePresenter picturesPagePresenter;
  const PicturesPage({
    required this.picturesPagePresenter,
    super.key,
  });

  @override
  State<PicturesPage> createState() => _PicturesPageState();
}

class _PicturesPageState extends State<PicturesPage> {
  @override
  void initState() {
    // widget.picturesPagePresenter.loadPictures();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesPageCubit, PicturesPageState>(
      bloc: widget.picturesPagePresenter as PicturesPageCubit,
      builder: (context, state) {
        // if (state is PicturesPageStateLoading) {
        //   return PicturesPageStateLoadingView(
        //     picturesPagePresenter: widget.picturesPagePresenter,
        //   );
        // } else if (state is PicturesPageStateLoadFailure) {
        //   return PicturesPageStateLoadFailureView(
        //     failureMessage: state.failureMessage,
        //     reload: widget.picturesPagePresenter.loadPictures,
        //   );
        // } else if (state is PicturesPageStateLoadSuccess) {
        return CatalogPageStateLoadSuccessView(
          presenter: widget.picturesPagePresenter,
          pictureViewModelList: mockList,
          // state.pictureViewModelList,
        );
        // } else {
        //   return const SizedBox.shrink();
        // }
      },
    );
  }
}

final mockList = [
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url:
        'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/NGC104_RGB_NASA.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url:
        'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/NGC104_RGB_NASA.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url:
        'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/NGC104_RGB_NASA.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url:
        'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/NGC104_RGB_NASA.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url:
        'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/NGC104_RGB_NASA.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/Tadpoles2048original.png',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url:
        'https://apod.nasa.gov/apod/image/2401/EarthMoon_Artemis1Saunders_1600.jpg',
  ),
  PictureViewModel(
    copyright: 'copyright',
    date: '2024-01-01',
    explanation: 'explanation',
    hdurl: 'hdurl',
    mediaType: 'mediaType',
    serviceVersion: 'serviceVersion',
    title: 'title',
    url: 'https://apod.nasa.gov/apod/image/2402/NGC104_RGB_NASA.jpg',
  ),
];
