import 'package:permission_handler/permission_handler.dart';
Future<bool?> requestStoragePermission() async {
  var status = await Permission.manageExternalStorage.request();
  if (status.isGranted) {
    // Storage permission is granted
    print("Storage permission granted");
    return true;
  } else if (status.isDenied) {
    await openAppSettings();

    return false;
    // Storage permission is denied
    print("Storage permission denied");
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();

    return false;
    // User opted to never ask for storage permission again
  }
}