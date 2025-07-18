import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:cv_builder/util/warning/snack_bar.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/drawer_menu.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../mvvm/viewmodel/social_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';
import '../home_page/home_small.dart';

class SocialPageSmall extends StatefulWidget {
  const SocialPageSmall({Key? key}) : super(key: key);

  @override
  State<SocialPageSmall> createState() => _SocialPageSmallState();
}

class _SocialPageSmallState extends State<SocialPageSmall> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialVM>(context,listen: false).GetSocialListData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v)async {
        Provider.of<MenuVM>(context,listen: false).setActiveItem(0);
        //   return false;
      },
      child: DashboarHelper(
      drawer: MobileDrawer(),
        appBar: AppBar(
            title:    Text(AppLocale.social_title.getString(context)),
            centerTitle: true,
            surfaceTintColor: panel_orange,
            primary: true,
            shadowColor: Colors.black54,

            leadingWidth: 55,
            leading:        InkWell(
              onTap: () async{
                Provider.of<SocialVM>(context,listen: false).SaveSocialList();
                SuccessSnack(context: context, title: AppLocale.success_submit.getString(context));


              },
              child: Container(
                margin: EdgeInsets.only(left:sl<ScreenSize>().width*0.04 ),
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: panel_green_accent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5
                      )
                    ]
                ),
                child: Icon(Icons.done,size: 20,color: panel_green,),
              ),
            )
        ),
        body: Container(
          height: sl<ScreenSize>().height,
          padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02,horizontal:  sl<ScreenSize>().width*0.02 ),
          child: SingleChildScrollView(
            /*
            form widget
             */
              child:Consumer<SocialVM>(
                builder: (context, value, child) {
                  if(value.socialList!=null){
                    // populate the inputs
                  //  PopulateInput(value.socialList!);
                  }

                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(AppLocale.social_subtitle.getString(context),style: Theme.of(context).textTheme.bodyMedium,),
                      SizedBox(height: 30,),

                          /*
                      github field
                       */
                          InputLabel(hint: AppLocale.social_github_hint.getString(context),name: AppLocale.social_github.getString(context),textEditingController: value.github_controller,),
                          SizedBox(height: sl<ScreenSize>().height*0.02),
                          /*
                      linkedin field
                       */
                           InputLabel(hint: AppLocale.social_linkedin_hint.getString(context),name: AppLocale.social_linkedin.getString(context),textEditingController: value.linkedin_controller,),



                      SizedBox(height: sl<ScreenSize>().height*0.02),

                      /*
                      Telegram field
                       */
                           InputLabel(hint: AppLocale.social_telegram_hint.getString(context),name: AppLocale.social_telegram.getString(context),textEditingController: value.telegram_controller,),

                          SizedBox(height: sl<ScreenSize>().height*0.02),
                          /*
                      Instagram field
                       */
                          InputLabel(hint: AppLocale.social_instagram_hint.getString(context),name: AppLocale.social_instagram.getString(context),textEditingController: value.instagram_controller,),




                      SizedBox(height: sl<ScreenSize>().height*0.02),

                          /*
                      birth field
                       */
                           InputLabel(hint: AppLocale.social_dribble_hint.getString(context),name: AppLocale.social_dribble.getString(context),textEditingController: value.dribble_controller,),
                          SizedBox(height: sl<ScreenSize>().height*0.02),
                          /*
                      name field
                       */
                          InputLabel(hint: AppLocale.social_site_hint.getString(context),name: AppLocale.social_site.getString(context),textEditingController: value.website_controller,),

                      /*
                  fourth row
                  profile and bio
                   */


                    ],
                  );
                },
              )
          ),
        ),
      ),
    );

  }
}
