import 'package:local_notifier/local_notifier.dart';

class NotificationProvider {
  late final String title;
  late final String body;
  late final LocalNotification notification;

  NotificationProvider({required this.title, required this.body}) {
    notification = LocalNotification(
      title: title,
      body: body,
    );
  }
}
