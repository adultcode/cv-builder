import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/setting_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import 'items/language_setting_item.dart';



ShowSetting(BuildContext context){

  showDialog(context:context,

      builder: (context) {
        return AlertDialog(

          backgroundColor: Colors.white,
          titlePadding: EdgeInsets.only(left: 5,top: 3),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          title:  Align(
            alignment: Alignment.topLeft,
            child: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.cancel_outlined,size: 28,color: work_text,)),
          ),
          content: Container(
              child: Consumer<SettingVM>(
                builder: (context, value, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/25.png',width: 150,height: 140,),
                      SizedBox(height: 20,),
                      Text(AppLocale.lang_setting_title.getString(context),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primary_title),),
                      SizedBox(height: 30,),
                      Container(
                        height: sl<ScreenSize>().height*0.065,
                        //  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //second option
                            Expanded(child: LangSettingItem(flag: "assets/iran.png",
                              isActive: value.current_language==1?true:false,
                              title: "فارسی",),),

                            SizedBox(width: 10,),
                            // first option
                            Expanded(
                                child: LangSettingItem(flag: "assets/english.png",
                                  isActive: value.current_language==2?true:false,
                                  title: StringConst.english_flag,)
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)

                    ],
                  );
                },
              )
          ),
        );
      }
  );

}
