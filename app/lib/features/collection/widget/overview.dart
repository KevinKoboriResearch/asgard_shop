import 'package:flutter/material.dart';
import 'package:nasa_apod_app/features/collection/state.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:provider/provider.dart';

class CollectionOverview extends StatelessWidget {
  const CollectionOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final itemCount =
        context.select((CollectionState state) => state.items.length);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.title3(
                  '$itemCount',
                  color: theme.colors.actionBarForeground,
                ),
                // TODO: NOW
                // AppIcon.regular(
                //   theme.icons.characters.vikoin,
                //   color: theme.colors.actionBarForeground,
                // ),
                Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
