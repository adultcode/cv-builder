import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:cv_builder/util/constant/string_const.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/menu/drawer_menu.dart';

class LanguageSmall extends StatefulWidget {
  const LanguageSmall({Key? key}) : super(key: key);

  @override
  State<LanguageSmall> createState() => _LanguageSmallState();
}

class _LanguageSmallState extends State<LanguageSmall> {

  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<LanguageVM>(context, listen: false).GetlanguageListData();
    });
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
            title:      Text(StringConst.language),
            centerTitle: true,
            surfaceTintColor: panel_orange,
            primary: true,
            shadowColor: Colors.black54,

            leadingWidth: 55,
            leading:  InkWell(
              onTap: () async{

                var _result = await  Provider.of<LanguageVM>(context,listen: false).SavelanguageList();

                if(_result==true){
                  if(Provider.of<LanguageVM>(context,listen: false).languageList==null ||
                      Provider.of<LanguageVM>(context,listen: false).languageList?.lang_list?.isEmpty==true)
                    SuccessSnack(context: context,title:StringConst.lang_isempty);
                  else
                    SuccessSnack(context: context,title: StringConst.success_submit);


                }else{

                  ErrorSnack(context: context,title: StringConst.error);

                }
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
            padding: EdgeInsets.symmetric(
                vertical: sl<ScreenSize>().height * 0.02,
                horizontal: sl<ScreenSize>().width * 0.03),
            child: SingleChildScrollView(
              child: Consumer<LanguageVM>(builder: (context, value, child) {
                if (value.selected_lang != null &&
                    value.selected_lang?.title != null) {

                }
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [


                     // SizedBox(height: 10,),
                      Text(StringConst.lang_subtitle,style: Theme.of(context).textTheme.bodyMedium,),
                      SizedBox(height: 30,),




                          /*
                          language title field
                           */
                           Container(
                                alignment: Alignment.centerRight,
                                decoration: input_decoration,
                                child: TextFormField(
                                  textAlignVertical : TextAlignVertical.center,
                                  cursorColor: Colors.black,
                                  validator: (value) {
                                    if (value?.isEmpty==true ) {
                                      return 'Please enter some text';
                                    }


                                    return null;
                                  },
                                  controller: value.title_controller,
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  decoration: input_text_decoration(
                                      controller: value.title_controller,
                                      hint: 'انگلیسی',
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)),
                                ),
                              ),


                      SizedBox(height: 20,),


                      /*
                          grade field
                           */
                      Row(
                        children: [
                          Container(
                            width:max( sl<ScreenSize>().width*0.04,36),
                            height: max( sl<ScreenSize>().width*0.04,36),

                            //   alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary_container
                            ),
                            child: IconButton(icon:Icon(Icons.add,size: 25,),color: primary_title,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Provider.of<LanguageVM>(context,listen: false).AddLanguage();
                              },),

                          ),
                          SizedBox(width: 6,),
                          // skil grade menu
                          Expanded(
                            child:  Container(
                              // margin: EdgeInsets.symmetric(horizontal: max(sl<ScreenSize>().width*0.04,20)),
                              child: Directionality(
                                textDirection: TextDirection.rtl,

                                child: SfSlider(
                                  activeColor: panel_orange,
                                  inactiveColor: panel_orange_accent,
                                  min: 1.0,
                                  max: 5.0,
                                  //    minorTicksPerInterval: 1,
                                 // shouldAlwaysShowTooltip: true,
                                  value: value.dropdownValue,
                                  interval: 1,
                                  showTicks: true,
                                  tickShape: SfTickShape(),
                                  //    showLabels: true,
                                  enableTooltip: true,
                                  onChanged: (dynamic newValue){
                                    setState(() {
                                      //    _value = value;
                                      value.dropdownValue =  Provider.of<LanguageVM>(context, listen: false).allowedValues.reduce((closest, value) => (value - newValue).abs() < (closest - newValue).abs() ? value : closest) as double;

                                    });
                                  },
                                ),
                              ),
                            ),

                          ),

                        ],
                      ),

                      /*
                        list of language items
                         */
                      SizedBox(height: sl<ScreenSize>().height*0.05,),
                      if(value.lang_items!=null)
                        ...value.lang_items!

                    ],
                  ),
                );
              }),
            )),
      ),
    );
  }
}
