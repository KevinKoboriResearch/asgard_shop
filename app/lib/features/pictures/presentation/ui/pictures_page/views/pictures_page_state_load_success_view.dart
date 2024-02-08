import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadSuccessView extends StatelessWidget {
  final PicturesPagePresenter picturesPagePresenter;
  final List<PictureViewModel>? pictureViewModelList;

  const PicturesPageStateLoadSuccessView({
    required this.picturesPagePresenter,
    required this.pictureViewModelList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // backgroundColor:
      //     //  Colors.transparent
      //     theme.colorScheme.background.withOpacity(0),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        // backgroundColor: theme.colorScheme.background.withOpacity(0.6),
        // Colors.transparent,
        // backgroundColor: ColorsUtils.background,
        title: SizedBox(
          height: 32,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              OutlinedButton(
                onPressed: picturesPagePresenter.loadPictures,
                child: const Text('List all'),
              ),
              const AppGap.medium(),
              // TODO: NOW
              // ApodDatePickerDialog(picturesPagePresenter),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: pictureViewModelList?.length ?? 0,
          itemBuilder: (context, index) {
            return AppPadding(
              padding: const AppEdgeInsets.symmetric(
                // TODO: NOW
                horizontal: AppGapSize.medium,
                vertical: AppGapSize.small,
              ),
              // ApodEdgeInsets.allMedium,
              // Theme.of(context).data.spacings.large.toInsets(),
              child: Container(),
              // TODO: NOW
              // ApodPicturesListTile(
              //   picturesPagePresenter: picturesPagePresenter,
              //   pictureViewModel: pictureViewModelList![index],
              // ),
            );
            // return Icon(Theme.of(context).data.)
          },
        ),
      ),
    );
  }
}
