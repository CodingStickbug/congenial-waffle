import 'dart:js_interop';
import 'package:flutter/material.dart';

@JS('Notification')
@staticInterop
class JSNotification {
  external factory JSNotification(String title, [JSNotificationOptions? options]);
  external static String get permission;
  external static JSAny? requestPermission(JSFunction callback);
}

@JS()
@anonymous
@staticInterop
class JSNotificationOptions {
  external factory JSNotificationOptions({String? body, String? icon});
}

void showWebNotification(String title, String body) {
  if (JSNotification.permission == 'granted') {
    JSNotification(title, JSNotificationOptions(body: body));
  } else if (JSNotification.permission != 'denied') {
    JSNotification.requestPermission(
      ((JSString permission) {
        if (permission == 'granted'.toJS) {
          JSNotification(title, JSNotificationOptions(body: body));
        }
      }).toJS as JSFunction,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Web Notification Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () =>
                showWebNotification('Hello', 'This is a web notification!'),
            child: Text('Show Notification'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}