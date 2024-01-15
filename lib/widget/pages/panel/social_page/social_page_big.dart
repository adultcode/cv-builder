import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/social_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';

class SocialPageBig extends StatefulWidget {
  const SocialPageBig({Key? key}) : super(key: key);

  @override
  State<SocialPageBig> createState() => _SocialPageBigState();
}

class _SocialPageBigState extends State<SocialPageBig> {

  var _linkedin_controller = TextEditingController();
  var _github_controller = TextEditingController();
  var _dribble_controller = TextEditingController();
  var _website_controller = TextEditingController();
  var _telegram_controller = TextEditingController();
  var _instagram_controller = TextEditingController();


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

              /*
            check if data get from shared prefences
            populate the form inputs
             */
              // if(value.infoModel!=null){
              //  // PopulateForm(value.infoModel!);
              // }
              return  Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: sl<ScreenSize>().height*0.02,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                          onTap: () async{
                            //   Provider.of<InfoVM>(context,listen: false).GetInfoModelData();


                            /*
                      save user's data
                       */
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
                        Text('شبکه های اجتماعی',style: Theme.of(context).textTheme.titleLarge,)

                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('ثبت اطلاعات مرتبط با شبکه های اجتماعی ',style: Theme.of(context).textTheme.bodyMedium,),
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
                            child: InputLabel(hint: 'github.com',name: 'گیتهاب',textEditingController: _github_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  linkedin field
                   */
                        Expanded(
                            child: InputLabel(hint: 'linkedin.com',name: 'لینکدین',textEditingController: _linkedin_controller,)
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
                            child: InputLabel(hint: 'Telegram.me',name: 'تلگرام',textEditingController: _telegram_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  Instagram field
                   */
                        Expanded(
                            child: InputLabel(hint: 'Instagram.com',name: 'اینستاگرام',textEditingController: _instagram_controller,)
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
                            child: InputLabel(hint: 'Dribble.com',name: 'دریبل',textEditingController: _dribble_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        /*
                  name field
                   */
                        Expanded(
                            child: InputLabel(hint: 'Site.com',name: 'وبسایت',textEditingController: _website_controller,)
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
