import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class PicturesPageStateLoadingView extends StatelessWidget {
  final PicturesPagePresenter picturesPagePresenter;

  const PicturesPageStateLoadingView({
    required this.picturesPagePresenter,
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
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
