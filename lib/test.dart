import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';


class PickImageTest extends StatefulWidget {
  const PickImageTest({Key? key}) : super(key: key);

  @override
  State<PickImageTest> createState() => _PickImageTestState();
}

class _PickImageTestState extends State<PickImageTest> {

  String name = '';
  String? error;
 // Uint8Lisxt data;
  var _image;
  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        print(image.path);
        if (kIsWeb) { // Check if this is a browser session
          _image = Image.network(image.path);
        } else {
          _image = Image.file(File(image.path));
        }
      } else {
        print("No image selected");
      }
    });
  }
  // pickImage() {
  //   final html.InputElement input = html.document.createElement('input');
  //   input
  //     ..type = 'file'
  //     ..accept = 'image/*';
  //   input.onChange.listen((e) {
  //     if (input.files.isEmpty) return;
  //     final reader = html.FileReader();
  //     reader.readAsDataUrl(input.files[0]);
  //     reader.onError.listen((err) => setState(() {
  //       error = err.toString();
  //     }));
  //     reader.onLoad.first.then((res) {
  //       final encoded = reader.result as String;
  //       // remove data:image/*;base64 preambule
  //       final stripped =
  //       encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
  //       setState(() {
  //         name = input.files[0].name;
  //         data = base64.decode(stripped);
  //         error = null;
  //       });
  //     });
  //   });
  //   input.click();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 50,),
                ElevatedButton(onPressed: () async{
                  _getImage();
                }, child: Text("Pick Image")),
                SizedBox(height: 50,),
                Container(
                  width: 100,
                  height: 100,
                  child: _image??Text('empty'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
