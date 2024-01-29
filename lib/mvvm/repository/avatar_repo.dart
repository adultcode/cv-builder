import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class AvatarRepository{

  //SharedPreferences sharedPreferences;

  Future<Uint8List?> ReadIMG()async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(StringConst.avatar_key)){
      String? imageBytesString = prefs.getString(StringConst.avatar_key);
      var   img_byte = base64Decode(imageBytesString!);
      return img_byte;

    }
}
}