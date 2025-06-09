import 'package:flutter/material.dart';
//Value Notifier: holds the data.
//Value listenable builder listens to the data

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);