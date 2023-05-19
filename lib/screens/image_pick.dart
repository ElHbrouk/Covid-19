import 'package:file_picker/file_picker.dart';

var imagePath;
var imageName;

class ImagePicker {
  Future<dynamic> pickFile() async {
    FilePickerResult? img = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
      dialogTitle: 'Upload a photo to our app',
    );
    if (img == null) return;
    PlatformFile file = img.files.single;
    imagePath = file.path.toString();
    imageName = file.name.toString();
    return file.path;
  }
}
