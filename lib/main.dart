import 'dart:async';

import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:cv_builder/test.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
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
import 'mvvm/viewmodel/profile_provider.dart';
import 'mvvm/viewmodel/skill_viewmodel.dart';
import 'mvvm/viewmodel/social_viewmodel.dart';
import 'mvvm/viewmodel/user_viewmodel.dart';
import 'mvvm/viewmodel/work_viewmodel.dart';
import 'widget/pages/cv/cv.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


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
            //  return LoadingPage();
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

 //late UserModel userModel;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      //Provider.of<InfoVM>(context,listen: false).GetInfoModelData();
      Provider.of<UserViewModel>(context,listen: false).GetUserModel();

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

                          build: (format) => generateResume(format,userModel:value.userModel! ),
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
