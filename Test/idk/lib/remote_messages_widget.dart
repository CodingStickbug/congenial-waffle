import 'package:flutter/material.dart';
import 'package:push/push.dart';
import 'package:idk/text_row.dart';

class RemoteMessagesWidget extends StatelessWidget {
  final List<RemoteMessage> remoteMessages;

  const RemoteMessagesWidget(this.remoteMessages, {super.key});

  @override
  Widget build(BuildContext context) {
    if (remoteMessages.isEmpty) {
      return const Text("No remote messages");
    }
    return Column(
      children: [
        ...remoteMessages.map((message) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextRow("Title", message.notification?.title.toString()),
                  TextRow("Body", message.notification?.body.toString()),
                  TextRow("Data", message.data?.toString())
                ],
              ),
            ))
      ],
    );
  }
}