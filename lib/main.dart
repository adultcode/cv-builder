import 'package:cv_builder/provider/icon_provider.dart';
import 'package:cv_builder/test.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'model/social_model.dart';
import 'model/user_model.dart';
import 'resume/cv_1/cv.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => IconProvider())
    ],
     child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
     // home: const PickImageTest(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  static late UserModel userModel;


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
    MyHomePage.userModel = UserModel();


    MyHomePage.userModel.socials = social_list;

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
              // ElevatedButton(onPressed: () async{
              //  // context.read<IconProvider>()
              //   Provider.of<IconProvider>(context,listen: false).SetIcon();
              //    }, child: Text("Pick Image")
              // ),
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
