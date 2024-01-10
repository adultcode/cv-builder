import 'dart:typed_data';

import 'package:cv_builder/mvvm/viewmodel/profile_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/locator.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/screen_size.dart';

class ChangeAvatar extends StatelessWidget {

  Uint8List? profile_img;

  ChangeAvatar({this.profile_img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  sl<ScreenSize>().height*0.25,
      margin: EdgeInsets.only(top: sl<ScreenSize>().height*0.035),
      child: DottedBorder(
        color: panel_orange,
        strokeWidth: 2,

        borderType: BorderType.RRect,
        strokeCap: StrokeCap.round,
        padding: EdgeInsets.all(10),
        radius: Radius.circular(4),
        dashPattern: [6, 10, 6,10],
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: panel_orange_accent,

              borderRadius: BorderRadius.all(Radius.circular(4))
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [


                  InkWell(
                    onTap: (){
                      context.read<ProfileProvider>().ChangeImage();
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        //  color: Colors.green,
                        image: DecorationImage(
                        //  image: NetworkImage('df')
                            image: profile_img != null ? MemoryImage(profile_img!) as ImageProvider<Object> : AssetImage('assets/me.png')
                            //image: profile_img != null ? NetworkImage(profile_img!) as ImageProvider<Object> : AssetImage('assets/me.png')
                        )
                      ),

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: Icon(Icons.add_circle,size: 20,color: panel_green,),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  context.read<ProfileProvider>().ReadIMG();

                },
                child: Text("تصویر پروفایل خود \n را انتخاب کنید",textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: panel_orange),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
