// ignore_for_file: deprecated_member_use, avoid_print, avoid_web_libraries_in_flutter

import 'dart:html';

void showWebNotification(String title, String body) {
  if (Notification.supported) {
    Notification.requestPermission().then((permission) {
      if (permission == 'granted') {
        Notification(title, body: body);
      }
    });
  } else {
    print('Web Notifications are not supported in this browser.');
  }
}

void main() {
  showWebNotification('Hello!', 'This is a web notification.');
}
