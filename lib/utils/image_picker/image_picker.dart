import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerProvider {
  Future<String?> pickImage(ImageSource imageSource) async {
    late PermissionStatus status;
    if (imageSource == ImageSource.camera) {
      status = await Permission.camera.request();
    } else {
      status = await Permission.camera.request();
    }
    if (status != PermissionStatus.granted) {
      return null;
    }
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      return image.path;
    }
    return null;
  }
}
