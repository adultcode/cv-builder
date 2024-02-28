import 'dart:typed_data';

import 'package:cv_builder/config/localize/languages.dart';
import 'package:cv_builder/mvvm/viewmodel/profile_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../config/locator.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/screen_size.dart';

class ChangeAvatar extends StatefulWidget {

  Uint8List? profile_img;

  ChangeAvatar({this.profile_img});

  @override
  State<ChangeAvatar> createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      // context.watch<InfoVM>().GetInfoModelData();
      Provider.of<ProfileProvider>(context,listen: false).ReadIMG();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  sl<ScreenSize>().width<ScreenSize.smallwidth? sl<ScreenSize>().height*0.17
          : sl<ScreenSize>().height*0.25,
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
              Consumer<ProfileProvider>(builder: (context, value, child) {

                return Stack(
                  children: [


                    InkWell(
                      onTap: (){
                        context.read<ProfileProvider>().PickImage();
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //  color: Colors.green,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                //  image: NetworkImage('df')
                                image: value.img_byte != null ? MemoryImage(value.img_byte!) as ImageProvider<Object> : AssetImage('assets/me.png')
                            )
                        ),

                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      child: Icon(Icons.add_circle,size: 20,color: panel_green,),
                    )
                  ],
                );
              },),


              InkWell(
                onTap: () {
                  context.read<ProfileProvider>().PickImage();

                },
                child: Text(AppLocale.choose_image.getString(context),textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: panel_orange),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
