import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';

class LanguageBig extends StatefulWidget {
  const LanguageBig({Key? key}) : super(key: key);

  @override
  State<LanguageBig> createState() => _LanguageBigState();
}

class _LanguageBigState extends State<LanguageBig> {

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
    return Container(
        height: sl<ScreenSize>().height,
        decoration: panel_container_decoration,
        padding: EdgeInsets.symmetric(
            vertical: sl<ScreenSize>().height * 0.02,
            horizontal: sl<ScreenSize>().width * 0.02),
        child: SingleChildScrollView(
          child: Consumer<LanguageVM>(builder: (context, value, child) {
            if (value.selected_lang != null &&
                value.selected_lang?.title != null) {
             // PopulateInputs(value.selected_lang!);
            }
            return Form(
              key: _formKey,
              child: Column(
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
                          var _result = await  Provider.of<LanguageVM>(context,listen: false).SavelanguageList();

                          if(_result==true){
                            if(Provider.of<LanguageVM>(context,listen: false).languageList==null ||
                                Provider.of<LanguageVM>(context,listen: false).languageList?.lang_list?.isEmpty==true)
                              SuccessSnack(context: context,title: AppLocale.lang_isempty.getString(context));
                            else
                              SuccessSnack(context: context,title: AppLocale.success_submit.getString(context));


                          }else{

                            ErrorSnack(context: context,title: AppLocale.error.getString(context));

                          }

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
                      Text(AppLocale.language.getString(context),style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(AppLocale.lang_subtitle.getString(context),style: Theme.of(context).textTheme.bodyMedium,),
                  SizedBox(height: 30,),


                  /*
                  first row
                  title and grade field
                   */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [



                      //  save btn
                              Container(
                                width:min( sl<ScreenSize>().width*0.041, min_icon_width),
                                height: min( sl<ScreenSize>().width*0.041, min_icon_width),
                               //   alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary_container
                                ),
                                  child: IconButton(icon:Icon(Icons.add),color: primary_title,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Provider.of<LanguageVM>(context,listen: false).AddLanguage();
                                  },),

                                ),

                              // skil grade menu
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: max(sl<ScreenSize>().width*0.04,20)),
                                width: min(sl<ScreenSize>().width*0.35,400),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,

                                  child: SfSlider(
                                    activeColor: panel_orange,
                                    inactiveColor: panel_orange_accent,
                                    min: 1.0,
                                    max: 5.0,
                                    //    minorTicksPerInterval: 1,
                               //     shouldAlwaysShowTooltip: true,
                                    value: value.dropdownValue,
                                    interval: 1.0,
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


                   //   SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                       title field
                       */
                        Container(
                            alignment: Alignment.centerRight,
                          width: min(sl<ScreenSize>().width*0.3,330),
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
                                  hint: AppLocale.language_hint.getString(context),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)),
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
                    // Wrap(
                    //   spacing: 11, // Add spacing between items
                    //   runSpacing: 11, // Add spacing between rows
                    //   alignment: WrapAlignment.end,
                    //   children: value.lang_items!,
                    // )
                ],
              ),
            );
          }),
        ));
  }
}
