import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/viewmodel/skill_viewmodel.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/skill_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
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
                    Text('لیست مهارت ها خود را در این بخش اضافه کنید ',style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 30,),

                    /*
                     work list view
                       */




                    /*
                first row
                title and grade field
                 */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                    grade field
                     */
                        Expanded(
                            child:  Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Row(
                                children: [
                                  Expanded(child: ElevatedButton(
                                    child: Text("ثبت"),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()){
                                        Provider.of<SkillVM>(context,listen: false).AddSkill();
                                       // ClearInpust();
                                      }
                                    },
                                  )),
                                  Expanded(child: Container()),
                                  // skil grade menu
                                  Expanded(
                                    child:  Container(
                                      //color: Colors.redAccent,
                                      alignment: Alignment.center,
                                      decoration: input_decoration,
                                      child: DropdownButtonHideUnderline(

                                        child: DropdownButton<double>(
                                          icon: Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Icon(Icons.arrow_drop_down,size: 20,),
                                          ),
                                          // Step 3.
                                          value: value.dropdownValue,
                                          // Step 4.
                                          items: <double>[10,20,30,40,50,60,70,80,90,100]
                                              .map<DropdownMenuItem<double>>((double value) {
                                            return DropdownMenuItem<double>(
                                              value: value,
                                              child: Container(
                                                child: Text(
                                                  value.toString(),
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 17),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (double? newValue) {
                                            value.ChangeValue(newValue!);

                                          },
                                        ),
                                      ),
                                    ),

                                  ),

                                ],
                              ),
                            ),

                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                    skill title field
                     */
                        Expanded(
                            child:  Container(
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
                            )
                        ),



                      ],
                    ),


                    /*
                    list of skill items
                     */
                    SizedBox(height: sl<ScreenSize>().height*0.05,),
                    if(value.skill_items!=null)
                      Wrap(
                        spacing: 11, // Add spacing between items
                        runSpacing: 11, // Add spacing between rows
                        alignment: WrapAlignment.end,
                        children: value.skill_items!,
                      )


                  ],
                ),
              );
            },
          ),
        ));
  }
}
