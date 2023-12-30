import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class IconProvider extends ChangeNotifier{

  Image? icon_path;
  String? img_path;
  Uint8List? img_byte;

  void SetIcon(String? icon){
    getImage();
    //notifyListeners();
  }


  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        print(image.path);
        img_path = image.path;
        img_byte =await image.readAsBytes();
        if (kIsWeb) { // Check if this is a browser session
          icon_path = Image.network(image.path);

        } else {
          icon_path = Image.file(File(image.path));

        }
      } else {
        print("No image selected");
      }
   notifyListeners();
  }
}