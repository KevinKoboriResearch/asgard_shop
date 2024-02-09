import 'package:nasa_apod_app/features/account/state.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:provider/provider.dart';

class CurrentUserAvatar extends StatelessWidget {
  const CurrentUserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final url = context.select((AccountState state) => state.picture);
    return UserAvatar(
      url: url,
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return ClipOval(
          child: child,
        );
      },
    );
  }
}
