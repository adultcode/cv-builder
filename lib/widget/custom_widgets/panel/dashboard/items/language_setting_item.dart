import 'package:cv_builder/mvvm/viewmodel/setting_viewmodel.dart';
import 'package:cv_builder/util/constant/string_const.dart';
import 'package:cv_builder/widget/pages/panel/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../util/constant/color.dart';
import '../../../../../util/constant/radius_size.dart';

class LangSettingItem extends StatelessWidget {

  String? title;
  bool? isActive;
  String? flag;


  LangSettingItem({this.title, this.isActive, this.flag});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (){
        Provider.of<SettingVM>(context, listen: false).ChangeLanguage(
          title==StringConst.english_flag?2:1
        );
        Navigator.pop(context);
      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        decoration: BoxDecoration(
          color: isActive==true?primary_container:Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(outer_radius)),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Example shadow
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 3.0), // Adjust shadow position
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(title!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title,fontSize: 13)),
            //SizedBox(width: 3,),
            Image.asset(flag!,),

          ],
        ),
      ),
    );
  }
}
