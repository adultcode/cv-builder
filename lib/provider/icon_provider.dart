import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../util/profile_image.dart';

class IconProvider extends ChangeNotifier{

  Uint8List? img_byte;

  void SetIcon()async{
   var image_byte = await getImage();
   if(image_byte!=null){
     img_byte = image_byte;
   }
    notifyListeners();
  }



}