import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Permission.videos;
  Permission.photos;
  Permission.audio;
  requestStoragePermission();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FilledButton(
            onPressed: () async {
              await requestStoragePermission();
              var file = await pickFile();
              await player.setFilePath(file!);
              player.play();
            },
            child: Text("Pick Folder"),
          ),
        ),
      ),
    );
  }
}

Future<void> pickFolder() async {
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

  if (selectedDirectory != null) {
    // Use the selectedDirectory path
    print('Selected folder: $selectedDirectory');
  } else {
    // User canceled the picker
    print('Folder selection canceled.');
  }
}

Future<void> pickAllFiles() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
  );
}

Future<String?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
    allowMultiple: true,
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    // print('Selected file: ${file.name}');
    // print('File path: ${file.path}');
    return file.path;
    // You can now use the file path to access or display the file
  } else {
    // User canceled the picker
    // print('File picking canceled.');
    return null;
  }
}

Future<void> requestStoragePermission() async {
  var status = await Permission.storage
      .request(); // Or Permission.manageExternalStorage
  if (status.isGranted) {
    // Permission granted, proceed with storage operations
    print("STORAGE PERMISSION GRANTED!!!!!!!!!!!!!!!!");
  } else if (status.isDenied) {
    // Permission denied
    print("Storage permission DENIED!!!!!!!!!!!!!!!!!!!!!!!.");
  } else if (status.isPermanentlyDenied) {
    // Permission permanently denied, guide user to app settings
    print("Storage permission permanently denied. Open app settings. FUCK!!!!!!!!!!!!!!!!!!!!!");
    openAppSettings(); // Opens app settings for the user
  }
}
