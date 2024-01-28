import 'dart:convert';
import 'dart:io';

import 'package:cv_builder/util/constant/string_const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/profile_image.dart';

class ProfileProvider extends ChangeNotifier{

  String? profile_image;
  Uint8List? img_byte;
  SharedPreferences? sharedPreferences;

  void ReadIMG()async{
    final prefs = await SharedPreferences.getInstance();
    String? imageBytesString = prefs.getString(StringConst.avatar_key);
    if (imageBytesString != null) {
      img_byte = base64Decode(imageBytesString);
       notifyListeners();
    }

  }
  void ChangeImage()async{
    final prefs = await SharedPreferences.getInstance();

    try {

      var image_byte = await getImage();
      //print(image_byte.toString());
      img_byte = image_byte;
      await prefs.setString(StringConst.avatar_key, base64Encode(img_byte!.toList()));

      notifyListeners();
      // If there's no error, get_data will contain the image path

      // Proceed with using the image path
    } catch (error) {
      // Handle the error gracefully
      print('Error getting image: $error');
      // Display an error message to the user or take other appropriate actions
    }
  }

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

  Future<String> _getImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        print(image.path);
        return image.path;
        // if (kIsWeb) { // Check if this is a browser session
        //   profile_image = Image.network(image.path);
        // } else {
        //   profile_image = Image.file(File(image.path));
        // }
      } else {
        print("No image selected");
        return Future.error('image error');
      }

  }
}