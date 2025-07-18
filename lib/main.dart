import 'dart:async';
import 'dart:io';
import 'package:cv_builder/util/constant/android_version.dart';
import 'package:cv_builder/util/constant/string_const.dart';
import 'package:cv_builder/widget/pages/cv/cv2/cv2.dart';
import 'package:cv_builder/widget/pages/cv/cv3/cv3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/localize/languages.dart';
import 'firebase_options.dart';

import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:cv_builder/test.dart';
import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:cv_builder/widget/pages/cv/cv1/cv1.dart';
import 'package:cv_builder/widget/pages/loading_page.dart';
import 'package:cv_builder/widget/pages/panel/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'config/locator.dart';
import 'mvvm/model/entity/user_model.dart';
import 'mvvm/model/entity/social_model/social_model.dart';
import 'mvvm/viewmodel/education_viewmodel.dart';
import 'mvvm/viewmodel/info_viewmodel.dart';
import 'mvvm/viewmodel/language_viewmodel.dart';
import 'mvvm/viewmodel/menu_viewmodel.dart';
import 'mvvm/viewmodel/privacy_viewmodel.dart';
import 'mvvm/viewmodel/profile_provider.dart';
import 'mvvm/viewmodel/setting_viewmodel.dart';
import 'mvvm/viewmodel/skill_viewmodel.dart';
import 'mvvm/viewmodel/social_viewmodel.dart';
import 'mvvm/viewmodel/template_viewmodel.dart';
import 'mvvm/viewmodel/user_viewmodel.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'mvvm/viewmodel/work_viewmodel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_localization/flutter_localization.dart';

import 'notification_controller.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
late AwesomeNotifications notifications;

void main() async{
  notifications = AwesomeNotifications();
 // print("---version------${Platform.version}");
  var channel =  NotificationChannel(
      channelKey: 'main_channel2',
      channelName: 'Flutter Main notification ',
      channelDescription: 'Notification channel description',
      playSound: false,

      defaultColor: Colors.blueAccent);

  AwesomeNotifications().initialize(
      null,
      [
        channel
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'channel_group1',
            channelGroupName: 'Channel group name')
      ],
      debug: true
  );

  AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod
  );




  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Listneing to the foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      showNotification(message.notification!.title!, message.notification!.body!,
          url_target: message.data["url"]);
    }
  });

 // print('User granted permission: ${settings.authorizationStatus}');
 // showNotification("title","body",url_target: "google.ir");
  setUpSL();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => IconProvider()),
      ChangeNotifierProvider(create: (context) => MenuVM()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => InfoVM()),
      ChangeNotifierProvider(create: (context) => UserViewModel()),
      ChangeNotifierProvider(create: (context) => WorkVM()),
      ChangeNotifierProvider(create: (context) => SocialVM()),
      ChangeNotifierProvider(create: (context) => EducationVM()),
      ChangeNotifierProvider(create: (context) => LanguageVM()),
      ChangeNotifierProvider(create: (context) => SkillVM()),
      ChangeNotifierProvider(create: (context) => TemplateVM()),
      ChangeNotifierProvider(create: (context) => SettingVM()),
      ChangeNotifierProvider(create: (context) => PrivacyVM()),
    ],
     child: MyApp(),)
  );

}


Future<void> showNotification(String title,String body,{String? url_target}) async {

  AwesomeNotifications().isNotificationAllowed().then((value) {
    if(!value){
      AwesomeNotifications().requestPermissionToSendNotifications();
      print("Permission: false");
    }else{


      notifications.createNotification(
        actionButtons:url_target!=null? [
          NotificationActionButton(key: "key", label: "مشاهده")
        ]:null,
          content: NotificationContent(
            id: 2,
            channelKey: 'main_channel2',
            title: title,
            //bigPicture: 'asset://assets/top.jpg',
            locked: false,
            notificationLayout: NotificationLayout.BigText,
            wakeUpScreen: true,

            actionType: ActionType.Default,
            payload: {'data':url_target},

            body: body,)
      );
    }

  });
}

// Lisitnening to the background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  showNotification(message.notification!.title!, message.notification!.body!,
  url_target: message.data["url"]);

//  print("Handling a background message: ${message.messageId}");
}
class MyApp extends StatefulWidget {



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var channel_name = "com.platform";
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  /// init localization package
    localization.init(
      mapLocales: [
         MapLocale('en', AppLocale.EN),
         MapLocale('fa', AppLocale.FA),
      ],
      initLanguageCode: 'en'

    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;

    /// init platform channel
    if(!kIsWeb){
      final platform = MethodChannel("com.platform");
      platform.setMethodCallHandler((call) async{
        if(call.method=="GetVersion"){
          //print("--------ANDROID: ${call.arguments}");
          OSVersion.AndroidVersion = call.arguments;
          //GetSMS(call.arguments);
          SaveVersion(call.arguments);
          return 0;

        }else{
          return MissingPluginException("not implemented");
        }
      },);
    }

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      LoadLanguage();
    });
  }

  void LoadLanguage({int? current_lang}) async{

    if(current_lang==null)
        current_lang =  await Provider.of<SettingVM>(context, listen: false).LoadSetting() ;
    if(current_lang==1){
      localization.translate("fa");
    }
    if(current_lang==2){
      localization.translate("en");

    }

  }
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  void SaveVersion(int _version)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(StringConst.os_key, _version);
  }

  @override
  Widget build(BuildContext context) {
    return      MaterialApp(

      //title: "جاب یار - رزومه ساز آنلاین",

        title: AppLocale.app_title.getString(context),
        onGenerateTitle: (context) {
          return AppLocale.app_title.getString(context);
        },
        debugShowCheckedModeBanner: false,
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,

        theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,secondary: Colors.red),
            useMaterial3: true,
            fontFamily: 'sdn',
            textTheme: TextTheme(
              titleLarge: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: primary_title),
              bodyMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: primary_title),
              bodyLarge: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: primary_title),
            )
        ),
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: Consumer<SettingVM>(
              builder: (context, value, child) {
                WidgetsFlutterBinding.ensureInitialized()
                    .scheduleFrameCallback((timeStamp) {
                  LoadLanguage(current_lang: value.current_language);
                });
                return LayoutBuilder(
                  builder: (context, constraints) {

                    sl<ScreenSize>().width =constraints.maxWidth;
                    sl<ScreenSize>().height =constraints.maxHeight;
                    //   print("---------${ sl<ScreenSize>().width}");

                    sl<ScreenSizeStream>().controller.add(sl<ScreenSize>());
                     return MyHomePage();
                    // return LoadingPage();
                    return Dashboard();
                  },);
              }
          ),
        )

    );

  }
}


class MyHomePage extends StatefulWidget {
 // static late UserModel userModel;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 //late UserModel userModel;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      Provider.of<InfoVM>(context,listen: false).GetInfoModelData();
      Provider.of<UserViewModel>(context,listen: false).GetUserModel();
      // Provider.of<TemplateVM>(context, listen: false).userModel = value.userModel;

    });
 }
  @override
  Widget build(BuildContext context) {
    //print("double: ${double.infinity.ceilToDouble()}");

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

          child: Column(
            children: [
              ElevatedButton(onPressed: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
               // context.read<IconProvider>()
//                Provider.of<IconProvider>(context,listen: false).SetIcon();
                 }, child: Text("Pick Image")
              ),
              Consumer<UserViewModel>(
                builder: (context, value, child) {
                  if(value.userModel!=null){
                    return Expanded(
                        child:  PdfPreview(
                          initialPageFormat: PdfPageFormat.a4,
                          useActions: true,
                          maxPageWidth: 700,

                          build: (format) => generateResumeCV2(format,userModel:value.userModel! ),
                          //  build: (format) => generateResume(format,profile_image_path: value.img_byte),
                        )
                    );
                  }return Text("Loading..");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
