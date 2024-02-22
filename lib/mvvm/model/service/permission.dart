import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/constant/android_version.dart';
import '../../../util/constant/string_const.dart';
Future<bool?> OldPermission()async {
var  status = await Permission.storage.status;
  if (status.isGranted) {
  // Storage permission is granted
  print("Storage permission granted");
  return true;
    }
  else if (status.isDenied) {
  print("denied");
  await Permission.storage.request();
  // await openAppSettings();
  print("Storage permission denied");

  return false;
  // Storage permission is denied
    }
else if (status.isPermanentlyDenied) {
  print("isPermanentlyDenied");

  await Permission.storage.request();

  // await openAppSettings();

      return false;
  // User opted to never ask for storage permission again
  }
}

Future<bool?> NewPermission()async {
  var  status = await Permission.manageExternalStorage.status;
  if (status.isGranted) {
    // Storage permission is granted
    print("Storage permission granted");
    return true;
  }
  else if (status.isDenied) {
    print("denied");
    await Permission.manageExternalStorage.request();
    // await openAppSettings();

    return false;
    // Storage permission is denied
    print("Storage permission denied");
  }
  else if (status.isPermanentlyDenied) {
    print("isPermanentlyDenied");

    await Permission.manageExternalStorage.request();

    // await openAppSettings();

    return false;
    // User opted to never ask for storage permission again
  }
}
Future<bool?> requestStoragePermission() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 var _api =  sharedPreferences.getInt(StringConst.os_key);
  print("--=-=-=-=-=Saved version : $_api");

  if(_api!<30){
    print("storage permission");
   return     await OldPermission();
  }else{
    print("manage storage permission");

  return  await NewPermission();

  }

}