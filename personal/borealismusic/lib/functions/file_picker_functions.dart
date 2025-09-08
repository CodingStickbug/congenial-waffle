import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<PlatformFile?> pickFileAndSaveLocally() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['mp3'],
    allowMultiple: false,
  );

  if (result != null) {
    PlatformFile file = result.files.first;
    final tempFile = File(file.path!);

    // Get app documents directory
    final appDocDir = await getApplicationDocumentsDirectory();

    // Optional: Create a unique filename to avoid overwrites
    final newFileName = '${DateTime.now().millisecondsSinceEpoch}_${file.name}';
    final savedFilePath = '${appDocDir.path}/$newFileName';

    // Copy file to app-controlled storage
    final savedFile = await tempFile.copy(savedFilePath);

    // Now update the path to the new location
    return PlatformFile(
      name: file.name,
      size: file.size,
      path: savedFile.path,
      bytes: file.bytes,
      readStream: file.readStream,
    );
  } else {
    return null;
  }
}
