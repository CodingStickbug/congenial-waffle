import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MobileScanner(
          onDetect: (capture) {
            final barcode = capture.barcodes.first;
            if (kDebugMode) {
              print('Type: ${barcode.format} Data: ${barcode.rawValue}');
            }
          },
        ),
      ),
    );
  }
}
