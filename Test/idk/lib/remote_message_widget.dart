import 'package:flutter/material.dart';
import 'package:push/push.dart';
import 'package:idk/text_row.dart';

class RemoteMessageWidget extends StatelessWidget {
  final RemoteMessage? remoteMessage;

  const RemoteMessageWidget(this.remoteMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (remoteMessage == null) {
      return const Text("No remote message");
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextRow("Title", remoteMessage!.notification?.title.toString()),
          TextRow("Body", remoteMessage!.notification?.body.toString()),
          TextRow("Data", remoteMessage!.data?.toString())
        ],
      ),
    );
  }
}