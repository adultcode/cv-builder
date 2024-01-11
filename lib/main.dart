import 'dart:async';

import 'package:cv_builder/provider/icon_provider.dart';
import 'package:cv_builder/test.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:cv_builder/widget/pages/panel/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'config/locator.dart';
import 'model/social_model.dart';
import 'model/user_model.dart';
import 'mvvm/viewmodel/menu_viewmodel.dart';
import 'mvvm/viewmodel/profile_provider.dart';
import 'widget/pages/cv/cv.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  setUpSL();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => IconProvider()),
      ChangeNotifierProvider(create: (context) => MenuVM()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
    ],
     child: MyApp(),)
  );
}

class MyApp extends StatefulWidget {



  // MyApp(){
  // }


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // ScreenSizeStream? screenSizeStream;
//  late ScreenSize screenSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // screenSizeStream = sl<ScreenSizeStream>();
    // screenSizeStream!.controller.stream.listen((event) {
    //   print("Event: $event");
    // });
    // screenSize = sl<ScreenSize>();
    //
    // screenSizeStream!.controller.add(screenSize);

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'sdn',
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,),
          bodyMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,),
          bodyLarge: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),
        )
      ),
      home: LayoutBuilder(

            builder: (context, constraints) {
              sl<ScreenSize>().width =constraints.maxWidth;
              sl<ScreenSize>().height =constraints.maxHeight;
              print("---------${ sl<ScreenSize>().width}");

              sl<ScreenSizeStream>().controller.add(sl<ScreenSize>());
             // return MyHomePage();
              return Dashboard();
        },)






      //   },
      // ),
     // home: const PickImageTest(),
    );
  }
}


class MyHomePage extends StatefulWidget {
 // static late UserModel userModel;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocialModel socialModel = SocialModel(address: 'lidsdsdssdson/user/hesam',socialType: SocialType.linkedin,icon_path: 's');
    SocialModel socialModel2 = SocialModel(address: 'lidsdsdssdson/user/hesam',socialType: SocialType.github,icon_path: 's');
    List<SocialModel> social_list = [
      SocialModel(address: '/user/hesam',socialType: SocialType.github),
      SocialModel(address: 'lidsdsdssdson/user/hesam',socialType: SocialType.linkedin)

    ];
   // MyHomePage.userModel = UserModel();


    //MyHomePage.userModel.socials = social_list;

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
               // context.read<IconProvider>()
                Provider.of<IconProvider>(context,listen: false).SetIcon();
                 }, child: Text("Pick Image")
              ),
              Expanded(
                  child: Consumer<IconProvider>(
                builder: (context, value, child) {
                  return PdfPreview(
                    initialPageFormat: PdfPageFormat.a4,
                    useActions: true,
                    maxPageWidth: 700,

                    build: (format) => generateResume(format,profile_image_path: value.img_byte),
                  );
                },
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
