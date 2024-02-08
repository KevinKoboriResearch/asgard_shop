import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadFailureView extends StatelessWidget {
  final String failureMessage;
  final void Function() reload;

  const PicturesPageStateLoadFailureView({
    required this.failureMessage,
    required this.reload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          //  Colors.transparent
          theme.colorScheme.background.withOpacity(0),
      extendBodyBehindAppBar: true,
      extendBody: true,
      // appBar: AppBar(
      //   // backgroundColor: theme.colorScheme.background.withOpacity(0.6),
      //   // Colors.transparent,
      //   // backgroundColor: ColorsUtils.background,
      //   title: SizedBox(
      //     height: 32,
      //     child: ListView(
      //       scrollDirection: Axis.horizontal,
      //       children: [
      //         OutlinedButton(
      //           onPressed: widget.picturesPagePresenter.loadPictures,
      //           child: const Text('List all'),
      //         ),
      //         ApodGaps.medium,
      //         ApodDatePickerDialog(widget.picturesPagePresenter),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(),
      // TODO: NOW PUT IT BACK
      // ApodReloadPage(
      //   error: failureMessage,
      //   reload: reload,
      // ),
    );
  }
}
