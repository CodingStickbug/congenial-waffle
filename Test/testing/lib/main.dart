import 'package:flutter/material.dart';
import 'package:testing/pages/home_page.dart';
import 'package:testing/services/notification_service.dart';

void main() async{
  await NotificationService.initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    const secondaryColor = Color(0xff6D28D9);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: "Awesome flutter Notification demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        shadowColor: secondaryColor,
      ),
      home: HomePage(),
    );
  }
}
