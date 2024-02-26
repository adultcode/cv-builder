import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/mvvm/viewmodel/work_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/education_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';

class EducationBig extends StatefulWidget {

  @override
  State<EducationBig> createState() => _EducationBigState();
}

class _EducationBigState extends State<EducationBig> {


  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      Provider.of<EducationVM>(context,listen: false).GetEducationListData();

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
          child: Consumer<EducationVM>(builder: (context, value, child) {

            if(value.selected_education!=null && value.selected_education?.title!=null){
             // PopulateInputs(value.selected_education!);
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

                      /*
                      save button
                       */
                      InkWell(
                        onTap: () async{
                          /*
                        save user's data
                         */
                          var _result = await  Provider.of<EducationVM>(context,listen: false).SaveEducationList();

                          if(_result==true){
                            if(Provider.of<EducationVM>(context,listen: false).educationList==null ||
                                Provider.of<EducationVM>(context,listen: false).educationList?.educationList?.isEmpty==true)
                              SuccessSnack(context: context,title: StringConst.ed_empty);
                            else
                              SuccessSnack(context: context,title: StringConst.success_submit);


                          }else{

                            ErrorSnack(context: context,title: StringConst.error);

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


                      Text(StringConst.ed_pagetitle,style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(StringConst.ed_subtitle,style: Theme.of(context).textTheme.bodyMedium,),
                  SizedBox(height: 30,),

                  /*
                     work list view
                       */

                  if(value.education_items!=null)
                    ...value.education_items!


                  /*
                first row
                title and grade field
                 */
                    , SizedBox(height: sl<ScreenSize>().height*0.02),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    grade field
                     */
                      Expanded(
                          child: InputLabel(hint: StringConst.ed_grade_hint,name: StringConst.ed_grade,textEditingController: value.grade_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    education title field
                     */
                      Expanded(
                          child: InputLabel(hint: StringConst.ed_title_hint,name: StringConst.ed_title,textEditingController: value.title_controller,)
                      ),



                    ],
                  ),
                  SizedBox(height: sl<ScreenSize>().height*0.04),

            /*
                sec row
                university and description field
                 */
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  SizedBox(width: sl<ScreenSize>().width*0.05),

                  /*
                          grade field
                           */
                  Expanded(
                  child: InputLabel(hint: StringConst.desc,name: StringConst.ed_desc,textEditingController: value.desc_controller,isOption: true,)
                  ),
                  SizedBox(width: sl<ScreenSize>().width*0.05),

            /*
                    education title field
                     */
                    Expanded(
                    child: InputLabel(hint:StringConst.ed_uni_hint,name: StringConst.ed_uni,textEditingController: value.university_controller,)
                    ),



                    ],
                    ),


                  SizedBox(height: sl<ScreenSize>().height*0.04),

            /*
                third row
                start and end date field
                 */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    company field
                     */
                      Expanded(
                          child: InputLabel(hint: '1402/02/01',name: StringConst.date_end,textEditingController: value.end_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    job title field
                     */
                      Expanded(
                          child: InputLabel(hint: '1402/01/02',name: StringConst.date_start,textEditingController: value.start_controller,)
                      ),



                    ],
                  ),
                  SizedBox(height: sl<ScreenSize>().height*0.04),

                  /*
                  save button
                   */
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  primary_container,
                    ),
                    onPressed: () {

                      if (_formKey.currentState!.validate()){

                        Provider.of<EducationVM>(context,listen: false).AddEducation();



                      }else{
                        ErrorSnack(context: context,title: StringConst.fill_all);
                      }
                    },
                    child: Text(StringConst.add,
                    style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title)),
                  ),


                ],
              ),
            );
          }),
        ));
  }
}
