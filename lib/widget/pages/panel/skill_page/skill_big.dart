import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/viewmodel/skill_viewmodel.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/skill_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_label.dart';

class SkillBig extends StatefulWidget {
  const SkillBig({Key? key}) : super(key: key);

  @override
  State<SkillBig> createState() => _SkillBigState();
}

class _SkillBigState extends State<SkillBig> {
  final _formKey = GlobalKey<FormState>();

  double _value = 40.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<SkillVM>(context, listen: false).GetskillListData();
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
          child: Consumer<SkillVM>(
            builder: (context, value, child) {
              if (value.selected_skill != null &&
                  value.selected_skill?.title != null) {
               // PopulateInputs(value.selected_skill!);
              }

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /*
                      save button
                       */
                        InkWell(
                          onTap: () async{
                            /*
                        save user's data
                         */
                            var _result = await  Provider.of<SkillVM>(context,listen: false).SaveSkillList();

                            if(_result==true){
                              if(Provider.of<SkillVM>(context,listen: false).skillList==null ||
                                  Provider.of<SkillVM>(context,listen: false).skillList?.skill_list?.isEmpty==true)
                                SuccessSnack(context: context,title: 'لیست مهارت های شما خالی است');
                              else
                                SuccessSnack(context: context,title: 'اطلاعات شما با موفقیت ثبت شد');


                            }else{

                              ErrorSnack(context: context,title: 'خطایی رخ داده است');

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


                        Text('مهارت ها',style: Theme.of(context).textTheme.titleLarge,)

                      ],
                    ),

                    SizedBox(height: 10,),
                    Text(StringConst.skill_subtitle,style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 30,),

                    SizedBox(height: 30,),





                    /*
                first row
                title and grade field
                 */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       // SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                    save btn
                     */
                        Container(
                          width:min_icon_width,
                          height: min_icon_width,
                          //   alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: panel_orange_accent
                          ),
                          child: IconButton(icon:Icon(Icons.add),color: panel_orange,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (_formKey.currentState!.validate()){
                                Provider.of<SkillVM>(context,listen: false).AddSkill();
                                // ClearInpust();
                              }
                            },),

                        ),

                        // slider


                          Container(
                           // margin: EdgeInsets.symmetric(horizontal: max(sl<ScreenSize>().width*0.04,20)),
                            width: min(sl<ScreenSize>().width*0.35,400),
                            child: Directionality(
                              textDirection: TextDirection.rtl,

                              child: SfSlider(
                                activeColor: panel_green,
                                inactiveColor: panel_green_accent,
                                min: 10.0,
                                max: 100.0,
                                //    minorTicksPerInterval: 1,
                                shouldAlwaysShowTooltip: true,
                                value: value.dropdownValue,
                                interval: 10,
                                showTicks: true,
                                                    tickShape: SfTickShape(),
                                //    showLabels: true,
                                enableTooltip: true,
                                onChanged: (dynamic newValue){
                                  setState(() {
                                    //    _value = value;
                                    value.dropdownValue =  Provider.of<SkillVM>(context, listen: false).allowedValues.reduce((closest, value) => (value - newValue).abs() < (closest - newValue).abs() ? value : closest) as double;

                                  });
                                },
                              ),
                            ),
                          ),
                       // ),
                      //  Text("میزان مهارت"),
                      //  SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                    skill title field
                     */
                         Container(
                           width: min(sl<ScreenSize>().width*0.3,330),
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
                                    hint: 'برنامه نویسی',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)),
                              ),
                            ),




                      ],
                    ),


                    /*
                    list of skill items
                     */
                    SizedBox(height: sl<ScreenSize>().height*0.05,),
                    if(value.skill_items!=null)
                      // Expanded(child:
                      // Container(
                      //   height: 100,
                      //   child: ListView.builder(
                      //     itemCount: value.skillList!.skill_list!.length,
                      //     itemBuilder: (context, index) {
                      //       return SkillItem(skillModell: value.skillList!.skill_list![index]!);
                      //     },
                      //   ),
                      // )
                      // )
                 //    value.skill_items
                 //      Wrap(
                 //        spacing: 11, // Add spacing between items
                 //        runSpacing: 11, // Add spacing between rows
                 //        alignment: WrapAlignment.end,
                 //        children: value.skill_items!,
                 //      )

                      ...value.skill_items!
                  ],
                ),
              );
            },
          ),
        ));
  }
}
