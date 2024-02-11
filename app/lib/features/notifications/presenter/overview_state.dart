import 'package:nasa_apod_core/nasa_apod_core.dart';

abstract class NotificationsOverviewState {}

class NotificationsOverviewStateLoadedData extends NotificationsOverviewState {
  final NotificationModel? lastNotification;

  NotificationsOverviewStateLoadedData({required this.lastNotification});

  factory NotificationsOverviewStateLoadedData.demo() =>
      NotificationsOverviewStateLoadedData(
        lastNotification: NotificationModel(
          title: 'Save 50% on shields this week',
          description: 'See the offer',
          type: NotificationType.offer,
        ),
      );
}

// class NotificationModel {
//   final String title;
//   final String description;
//   final NotificationType type;

//   const NotificationModel({
//     required this.type,
//     required this.title,
//     required this.description,
//   });
// }

// enum NotificationType {
//   offer,
// }
