import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:flutter_svg/svg.dart';

class PicturesPageHeader extends StatelessWidget {
  const PicturesPageHeader({
    super.key,
    required this.controller,
    required this.image,
  });

  final ScrollController controller;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedBuilder(
      animation: controller,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(
            theme.spacing.large,
          ),
          child: 
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Container(
          //         height: theme.typography.title1.fontSize,
          //         width: theme.typography.title1.fontSize! * 1.5,
          //         alignment: Alignment.centerLeft,
          //         child: SvgPicture(theme.images.appLogo),
          //       ),
          //       AppGap.semiSmall(),
                Container(
                  // color: Colors.red,
                  height: theme.typography.title1.fontSize,
                  width: theme.typography.title1.fontSize! * 3,
                  alignment: Alignment.centerLeft,
                  child: SvgPicture(theme.images.appWarmLogo),
                ),
          //       AppGap.big(),
          //       AppGap.semiBig(),
          //     ],
          //   ),
          // ),
        ),
      ),
      builder: (context, child) {
        final scrollAmount = (1 -
                (controller.offset.abs() /
                    theme.typography.title1.fontSize! *
                    0.5))
            .clamp(0, 1);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              // image: theme.images.backgroundPattern,
              fit: BoxFit.cover,
              opacity: 0.025 + 0.575 * scrollAmount,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
