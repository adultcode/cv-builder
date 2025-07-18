import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

Future<Uint8List?> getImage() async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    print(image.path);
    return await image.readAsBytes();

  } else {
    print("No image selected");
    return null;
  }
}