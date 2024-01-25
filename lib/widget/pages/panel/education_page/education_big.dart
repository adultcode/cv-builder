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

  var _title_controller = TextEditingController();
  var _grade_controller = TextEditingController();
  var _university_controller = TextEditingController();
  var _start_controller = TextEditingController();
  var _end_controller = TextEditingController();
  var _desc_controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      Provider.of<EducationVM>(context,listen: false).GetEducationListData();

    });
  }


  void PopulateInputs(EducationModel educationModel){
    _title_controller.text = educationModel.title!;
    _grade_controller.text = educationModel.grade!;
    _university_controller.text = educationModel.university!;
    _start_controller.text = educationModel.start_date!;
    _end_controller.text = educationModel.end_date!;
    _desc_controller.text = educationModel.description!;
  }

  void ClearInpust(){
    _title_controller.clear();
    _university_controller.clear();
    _start_controller.clear();
    _end_controller.clear();
    _desc_controller.clear();
    _grade_controller.clear();
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
              PopulateInputs(value.selected_education!);
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
                          if (value.educationList?.educationList!=null) {
                            // print("Work size from buld: ${value.worklList?.workModels?.length}");
                            Provider.of<EducationVM>(context,listen: false).SaveWorkList(educationList: value.educationList!);
                            SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');
                            print("Size of total works: ${value.educationList?.educationList?.length}");


                          }

                          else{
                            ErrorSnack(context: context,title: 'شما هیچ سابقه تحصیلی ثبت نکرده اید');

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


                      Text('تحصیلات',style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),

                  SizedBox(height: 10,),
                  Text('لیست تحصیلات و دوره های گذرانده شده در دانشگاه و موسسات ',style: Theme.of(context).textTheme.bodyMedium,),
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
                  ,Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    grade field
                     */
                      Expanded(
                          child: InputLabel(hint: 'کارشناسی ارشد',name: 'مقطع',textEditingController: _grade_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    education title field
                     */
                      Expanded(
                          child: InputLabel(hint: 'مهندسی کامپیوتر',name: 'رشته تحصیلی',textEditingController: _title_controller,)
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
                  child: InputLabel(hint: 'توضیحات',name: 'توضیحات(اختیاری)',textEditingController: _desc_controller,isOption: true,)
                  ),
                  SizedBox(width: sl<ScreenSize>().width*0.05),

            /*
                    education title field
                     */
                    Expanded(
                    child: InputLabel(hint: 'صنعتی شریف',name: 'دانشگاه',textEditingController: _university_controller,)
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
                          child: InputLabel(hint: '1402/02/01',name: 'تاریخ اتمام',textEditingController: _end_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    job title field
                     */
                      Expanded(
                          child: InputLabel(hint: '1402/01/02',name: 'تاریخ شروع',textEditingController: _start_controller,)
                      ),



                    ],
                  ),
                  SizedBox(height: sl<ScreenSize>().height*0.04),

                  /*
                  save button
                   */
                  ElevatedButton(
                    onPressed: () {

                      if (_formKey.currentState!.validate()){
                        // add new work model in list of work models
                        // var wo = WorkModel(title:_title_controller.text,



                        Provider.of<EducationVM>(context,listen: false).AddEducation(
                            educationModel: EducationModel(
                            title:_title_controller.text,
                            university: _university_controller.text,
                            description: _desc_controller.text,
                            start_date: _start_controller.text,
                            grade: _grade_controller.text,
                            end_date: _end_controller.text) );
                        //
                        // // clear data after add new data
                         ClearInpust();
                        SuccessSnack(context: context,title: 'دریافت شد');

                      }else{
                        ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');
                      }
                    },
                    child: Text("اضافه کردن"),
                  ),


                ],
              ),
            );
          }),
        ));
  }
}
