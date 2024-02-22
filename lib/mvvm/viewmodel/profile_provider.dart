import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:cv_builder/util/constant/string_const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../util/profile_image.dart';
import '../model/service/permission.dart';
import '../repository/avatar_repo.dart';

class ProfileProvider extends ChangeNotifier{

  // String? profile_image;
  Uint8List? img_byte;
  SharedPreferences? sharedPreferences;

 late ImagePicker picker;
late  AvatarRepository avatarRepository;
  ProfileProvider(){
    avatarRepository = AvatarRepository();
  }

  void ReadIMG()async{
    var result = await avatarRepository.ReadIMG();
    if(result !=null){

      img_byte = result;
      notifyListeners();

    }


  }


  //android platform for pick image
  void PickAndroidImage()async{
    if (await requestStoragePermission()==true) {
      // We haven't asked for permission yet or the permission has been denied before, but not permanently.


      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if(image!=null){
        img_byte = await image.readAsBytes();

        await sharedPreferences?.setString(StringConst.avatar_key, base64Encode(img_byte!.toList()));

        notifyListeners();

      }

    }

  }
// General method for pick image
  void PickImage()async{
    var check_permission  = await requestStoragePermission();
    if(check_permission==true && check_permission !=null) {


    picker = ImagePicker();
    sharedPreferences = await SharedPreferences.getInstance();

    if(kIsWeb){
      // call web method
      await PickWebImage();

    }else{
      // call android method
       PickAndroidImage();
    }
  }
  }
  // web platform image picker
   PickWebImage() async {

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        print(image.path);
        img_byte = await image.readAsBytes();

        await sharedPreferences?.setString(StringConst.avatar_key, base64Encode(img_byte!.toList()));

        notifyListeners();

      } else {
        print("No image selected");
      }

  }

}