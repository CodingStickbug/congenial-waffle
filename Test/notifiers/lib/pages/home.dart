import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalNotification notification = LocalNotification(
  title: "local_notifier_example",
  body: "hello flutter!",
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FloatingActionButton(onPressed: () => notification.show(),)
          ],
        ),
      ),
    );
  }
}