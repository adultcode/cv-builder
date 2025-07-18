import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class NotificationController {

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
    print("-------dismiss----");
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {


    print('-----action called-----');
    var _data = receivedAction.payload?['data'];
    print("_data: $_data");
    if(_data!=null){
      OpenLink(_data);

    }
    print("----${receivedAction.payload.toString()}");
  }

  static OpenLink(String url) async {

    if (!await launchUrl(Uri.parse(url) ,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ');
    }

  }

}