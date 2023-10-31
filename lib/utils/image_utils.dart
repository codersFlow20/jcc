import 'dart:io';
import 'dart:developer' as dev;
import 'package:image/image.dart' as img;

class ImageUtils {
  static Future<bool> isSizeInRange(File imageFile) async {
    final imageBytes = await imageFile.readAsBytes();
    img.Image? image = img.decodeImage(imageBytes);

    int targetSizeInBytes = 3 * 1024 * 1024;

    if (image != null) {
      int imageSizeInBytes = img.encodeJpg(image).length;
      dev.log('Image size in MB: ${imageSizeInBytes / 1024 / 1024}',
          name: 'Image');

      if (imageSizeInBytes > targetSizeInBytes) {
        return false;
      }
    }

    return true;
  }
}
