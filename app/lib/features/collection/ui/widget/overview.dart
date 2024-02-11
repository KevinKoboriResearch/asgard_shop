import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class CollectionOverview extends StatelessWidget {
  const CollectionOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return BlocBuilder<CollectionOverviewBloc, CollectionOverviewState>(
      builder: (context, state) {
        if (state is CollectionOverviewStateLoadedData) {
          final itemCount = state.collectionList.length;
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
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
