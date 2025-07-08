import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/js.dart';

void main() {
  if (kIsWeb) {
    context.callMethod("showNotification", ["Title", "custom message"]);
  } 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
