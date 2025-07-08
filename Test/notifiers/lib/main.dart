import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:notifiers/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await localNotifier.setup(
    appName: 'OmniSoft App',
    shortcutPolicy: ShortcutPolicy.requireCreate,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff416ff4),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF7F9FB),
      ),
      home: const HomePage(),
    );
  }
}