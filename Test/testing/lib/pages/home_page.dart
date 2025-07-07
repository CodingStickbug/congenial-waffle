import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:testing/services/notification_service.dart';
import 'package:testing/widgets/notification_button.dart';
import 'package:testing/widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.grey[200]!],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBar(title: "Awesome Notifications"),
            NotificationButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  title: "Hello",
                  body: "World",
                );
              },
              text: "Normal Notification",
            ),
            NotificationButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  title: "Summary Notification",
                  body: "Wow, what a nice Notification",
                  summary: "S U M M A R I Z E",
                  notificationLayout: NotificationLayout.Inbox,
                );
              },
              text: "Notification with Summary",
            ),
            NotificationButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  title: "L O B O T O M I T E !",
                  body: "T H I S... is a N O T I F I C A T I O N!",
                  summary: "Mentat?",
                  notificationLayout: NotificationLayout.ProgressBar,
                );
              },
              text: "Progress B A R",
            ),
            NotificationButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  title: "title",
                  body: "body",
                  summary: "S U M M A R Y",
                  notificationLayout: NotificationLayout.Messaging,
                );
              },
              text: "M E S S A G E",
            ),
            NotificationButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  title: "title",
                  body: "body",
                  notificationLayout: NotificationLayout.MediaPlayer,
                );
              },
              text: "M E D I A",
            ),
            NotificationButton(
              onPressed: () async {
                NotificationService.showNotification(
                  title: "title",
                  body: "body",
                  payload: {"navigate": "true"},
                  actionButtons: [
                    NotificationActionButton(
                      key: "check",
                      label: "Check it out!",
                      actionType: ActionType.SilentAction,
                      color: Colors.green,
                    ),
                  ],
                );
              },
              text: "And... ACTION!",
            ),
            NotificationButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  title: "Wow",
                  body: "Y A Y",
                  scheduled: true,
                  interval: Duration(seconds: 10),
                );
              },
              text: "Schedules B U T T O N",
            ),
          ],
        ),
      ),
    );
  }
}
