import 'dart:convert';

import 'package:cv_builder/config/localize/languages.dart';
import 'package:cv_builder/util/constant/string_const.dart';
import 'package:cv_builder/util/warning/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/social_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../custom_widgets/panel/input_label.dart';
import 'package:flutter_localization/flutter_localization.dart';
class SocialPageBig extends StatefulWidget {
  const SocialPageBig({Key? key}) : super(key: key);

  @override
  State<SocialPageBig> createState() => _SocialPageBigState();
}

class _SocialPageBigState extends State<SocialPageBig> {






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialVM>(context,listen: false).GetSocialListData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.white,
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
      padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02,horizontal:  sl<ScreenSize>().width*0.02 ),
      child: SingleChildScrollView(
        /*
        form widget
         */
          child:Consumer<SocialVM>(
            builder: (context, value, child) {
              if(value.socialList!=null){
                // populate the inputs
             //   PopulateInput(value.socialList!);
              }

              return  Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: sl<ScreenSize>().height*0.02,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                          onTap: () async{
                            /*
                      save user's data
                       */
                            Provider.of<SocialVM>(context,listen: false).SaveSocialList();
                            SuccessSnack(context: context, title: AppLocale.success_submit.getString(context));

                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: panel_green_accent,
                            ),
                            child: Icon(Icons.done,size: 20,color: panel_green,),
                          ),
                        ),
                        Text(AppLocale.social_title.getString(context),style: Theme.of(context).textTheme.titleLarge,)

                      ],
                    ),

                    SizedBox(height: 10,),
                    Text(AppLocale.social_subtitle.getString(context) ,style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 30,),



                    /*
               first row
               linkedin and github field
               */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  github field
                   */
                        Expanded(
                            child: InputLabel(hint: AppLocale.social_github_hint.getString(context),name: AppLocale.social_github.getString(context),textEditingController: value.github_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  linkedin field
                   */
                        Expanded(
                            child: InputLabel(hint: AppLocale.social_linkedin_hint.getString(context),name: AppLocale.social_linkedin.getString(context) ,textEditingController: value.linkedin_controller,)
                        ),


                      ],
                    ),
                    /*
              second row
              Instagram and Telegram field
               */
                    SizedBox(height: sl<ScreenSize>().height*0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  Telegram field
                   */
                        Expanded(
                            child: InputLabel(hint: AppLocale.social_telegram_hint.getString(context),name: AppLocale.social_telegram.getString(context),textEditingController: value.telegram_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  Instagram field
                   */
                        Expanded(
                            child: InputLabel(hint:AppLocale.social_instagram_hint.getString(context),name: AppLocale.social_instagram.getString(context),textEditingController: value.instagram_controller,)
                        ),


                      ],
                    ),
                    /*
              third row
              birth and city field
               */
                    SizedBox(height: sl<ScreenSize>().height*0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  birth field
                   */
                        Expanded(
                            child: InputLabel(hint: AppLocale.social_dribble_hint.getString(context),name: AppLocale.social_dribble.getString(context),textEditingController: value.dribble_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  name field
                   */
                        Expanded(
                            child: InputLabel(hint: AppLocale.social_site_hint.getString(context),name: AppLocale.social_site.getString(context),textEditingController: value.website_controller,)
                        ),


                      ],
                    ),
                    /*
              fourth row
              profile and bio
               */
                    SizedBox(height: sl<ScreenSize>().height*0.04),


                  ],
                );
            },
          )
      ),
    );

  }
}
