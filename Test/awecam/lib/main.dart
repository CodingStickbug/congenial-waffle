import 'dart:io';

import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  CameraAwesomeBuilder.awesome(saveConfig: SaveConfig.photo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CameraAwesomeBuilder.awesome(
          sensorConfig: SensorConfig.single(
            aspectRatio: CameraAspectRatios.ratio_4_3,
            flashMode: FlashMode.auto,
            sensor: Sensor.position(SensorPosition.back),
            zoom: 0.0,
          ),
          saveConfig: SaveConfig.photo(
            exifPreferences: ExifPreferences(saveGPSLocation: false),
            pathBuilder: (sensors) async {
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory(
                '${extDir.path}/camerawesome',
              ).create(recursive: true);
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                // 3.
                return SingleCaptureRequest(filePath, sensors.first);
              } else {
                // 4.
                return MultipleCaptureRequest({
                  for (final sensor in sensors)
                    sensor:
                        '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
