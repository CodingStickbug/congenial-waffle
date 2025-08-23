

import 'package:file_picker/file_picker.dart';

Future<PlatformFile?> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
    allowMultiple: true,
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    // print('Selected file: ${file.name}');
    // print('File path: ${file.path}');
    return file;
    // You can now use the file path to access or display the file
  } else {
    // User canceled the picker
    // print('File picking canceled.');
    return null;
  }
}