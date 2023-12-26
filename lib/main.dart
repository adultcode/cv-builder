import 'package:cv_builder/provider/icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'resume/cv_1/cv.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider(create: (context) => IconProvider(),)
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
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //print("double: ${double.infinity.ceilToDouble()}");

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          // child: Center(
          //   child: ElevatedButton(
          //     onPressed: (){
          //
          //     },
          //     child: Text("Create pdf"),
          //   ),
          // ),
          child: PdfPreview(
            initialPageFormat: PdfPageFormat.a4,
           useActions: true,
           maxPageWidth: 700,

            build: (format) => generateResume(format,context),
          ),
        ),
      ),
    );
  }
}
