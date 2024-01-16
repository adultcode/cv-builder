import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
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

  var _linkedin_controller = TextEditingController(); //0
  var _github_controller = TextEditingController();   // 1
  var _dribble_controller = TextEditingController();  // 2
  var _website_controller = TextEditingController();  // 3
  var _telegram_controller = TextEditingController(); // 4
  var _instagram_controller = TextEditingController();  // 5

  List<SocialModel?> _social_list = List<SocialModel?>.filled(6,null);





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocialVM>(context,listen: false).GetSocialListData();

  }
  List<SocialModel?> GetInputData(){


    // check linkedin
    if(_linkedin_controller.text.isNotEmpty) _social_list[0] = SocialModel(address: _linkedin_controller.text,socialType: SocialType.linkedin);
    else _social_list[0] = null;

    // check github
    if(_github_controller.text.isNotEmpty) _social_list[1] = SocialModel(address: _github_controller.text,socialType: SocialType.github);
    else _social_list[1] = null;

    // check dribble
    if(_dribble_controller.text.isNotEmpty) _social_list[2] = SocialModel(address: _dribble_controller.text,socialType: SocialType.dribble);
    else _social_list[2] = null;

    // check website
    if(_website_controller.text.isNotEmpty) _social_list[3] = SocialModel(address: _website_controller.text,socialType: SocialType.other);
    else _social_list[3] = null;

    // check telegram
    if(_telegram_controller.text.isNotEmpty) _social_list[4] = SocialModel(address: _telegram_controller.text,socialType: SocialType.telegram);
    else _social_list[4] = null;

    // check telegram
    if(_instagram_controller.text.isNotEmpty) _social_list[5] = SocialModel(address: _instagram_controller.text,socialType: SocialType.instagram);
    else _social_list[5] = null;

    return _social_list;
  }

  void PopulateInput(SocialList socialList){

    //linkedin
    _linkedin_controller.text = socialList.socialModels?[0]?.address??"";

    //github
    _github_controller.text = socialList.socialModels?[1]?.address??"";

    //dribble
    _dribble_controller.text = socialList.socialModels?[2]?.address??"";

    //website
    _website_controller.text = socialList.socialModels?[3]?.address??"";

    //telegram
    _telegram_controller.text = socialList.socialModels?[4]?.address??"";

    //instagram
    _instagram_controller.text = socialList.socialModels?[5]?.address??"";



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
                PopulateInput(value.socialList!);
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
                            SocialList socialList = SocialList(socialModels: GetInputData());
                            Provider.of<SocialVM>(context,listen: false).SaveSocialList(social: socialList);

                            //   Provider.of<InfoVM>(context,listen: false).GetInfoModelData();
                            // SocialModel social = SocialModel(socialType: SocialType.dribble,address: 'ad',icon_path: 'adasd');
                            // SocialModel social2 = SocialModel(socialType: SocialType.telegram,address: 'tel',icon_path: 'zz');
                            // SocialList _list = SocialList();
                            // List<SocialModel?> soc_list= [
                            //   social,social2,null
                            // ];
                            // _list.socialModels = soc_list;
                            // print(json.encode(_list.toJson()));
                           // // _list.socialModels?.add(social2);
                           // var tem = '{"socialModels":[{"address":"ad","icon_path":"adasd","socialType":"dribble"},{"address":"tel","icon_path":"zz","socialType":"telegram"},null]}';
                           // SocialList sl2 = SocialList.fromJson(json.decode(tem));
                           // print(sl2.socialModels![2]?.address.toString());

                          //  if(_linkedin_controller.text.isNotEmpty) social.

                      //      print(social.toJson());


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
