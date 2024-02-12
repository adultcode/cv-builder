import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/mvvm/viewmodel/work_viewmodel.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
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
import '../../../custom_widgets/panel/menu/drawer_menu.dart';

class EducationSmall extends StatefulWidget {

  @override
  State<EducationSmall> createState() => _EducationSmallState();
}

class _EducationSmallState extends State<EducationSmall> {


  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      Provider.of<EducationVM>(context,listen: false).GetEducationListData();

    });
  }


  // void PopulateInputs(EducationModel educationModel){
  //   _title_controller.text = educationModel.title!;
  //   _grade_controller.text = educationModel.grade!;
  //   _university_controller.text = educationModel.university!;
  //   _start_controller.text = educationModel.start_date!;
  //   _end_controller.text = educationModel.end_date!;
  //   _desc_controller.text = educationModel.description!;
  // }
  //
  // void ClearInpust(){
  //   _title_controller.clear();
  //   _university_controller.clear();
  //   _start_controller.clear();
  //   _end_controller.clear();
  //   _desc_controller.clear();
  //   _grade_controller.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return DashboarHelper(
      appBar: AppBar(
          title:   Text("تحصیلات"),
          centerTitle: true,
          surfaceTintColor: panel_orange,
          primary: true,
          shadowColor: Colors.black54,

          leadingWidth: 55,
          leading:        InkWell(

            onTap: () async{

              // var resul = await     Provider.of<InfoVM>(context,listen: false).SaveInfoData();
              // if(resul==true)     SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');
              var _result = await  Provider.of<EducationVM>(context,listen: false).SaveEducationList();

              if(_result==true){
                if(Provider.of<EducationVM>(context,listen: false).educationList==null ||
                    Provider.of<EducationVM>(context,listen: false).educationList?.educationList?.isEmpty==true)
                  SuccessSnack(context: context,title: 'سوابق کاری شما خالی است');
                else
                  SuccessSnack(context: context,title: 'اطلاعات شما با موفقیت ثبت شد');


              }else{

                ErrorSnack(context: context,title: 'خطایی رخ داده است');

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
        drawer: MobileDrawer(),
      body: Container(
          height: sl<ScreenSize>().height,
         // decoration: panel_container_decoration,
          padding: EdgeInsets.symmetric(
              vertical: sl<ScreenSize>().height * 0.02,
              horizontal: sl<ScreenSize>().width * 0.02),
          child: SingleChildScrollView(
            child: Consumer<EducationVM>(builder: (context, value, child) {

              if(value.selected_education!=null && value.selected_education?.title!=null){
                //PopulateInputs(value.selected_education!);
              }
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [

                    SizedBox(height: sl<ScreenSize>().height*0.02,),

                    Text('لیست تحصیلات و دوره های گذرانده شده در دانشگاه و موسسات ',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium,),
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

                        ,SizedBox(height: 20,),

                        /*
                      grade field
                       */
                        InputLabel(hint: 'کارشناسی ارشد',name: 'مقطع',textEditingController: value.grade_controller,),
                        SizedBox(height: sl<ScreenSize>().height*0.02),

                        /*
                      education title field
                       */
                         InputLabel(hint: 'مهندسی کامپیوتر',name: 'رشته تحصیلی',textEditingController: value.title_controller,),



                    SizedBox(height: sl<ScreenSize>().height*0.02),

                    /*
                  sec row
                  university and description field
                   */


                        /*
                            grade field
                             */
                    InputLabel(hint: 'صنعتی شریف',name: 'دانشگاه',textEditingController: value.university_controller,),

                    SizedBox(height: sl<ScreenSize>().height*0.02),

                        /*
                      education title field
                       */
                    InputLabel(hint: 'توضیحات',name: 'توضیحات(اختیاری)',textEditingController: value.desc_controller,isOption: true,),


                    SizedBox(height: sl<ScreenSize>().height*0.02),

                    /*
                  third row
                  start and end date field
                   */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       // SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                      company field
                       */
                        Expanded(
                            child: InputLabel(hint: '1402/02/01',name: 'تاریخ اتمام',textEditingController: value.end_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                      job title field
                       */
                        Expanded(
                            child: InputLabel(hint: '1402/01/02',name: 'تاریخ شروع',textEditingController: value.start_controller,)
                        ),



                      ],
                    ),
                    SizedBox(height: sl<ScreenSize>().height*0.04),

                    /*
                    save button
                     */
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        //  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        backgroundColor: primary_container,

                      ),
                      onPressed: () {

                        if (_formKey.currentState!.validate()){
                          // add new work model in list of work models
                          // var wo = WorkModel(title:_title_controller.text,



                          Provider.of<EducationVM>(context,listen: false).AddEducation();
                          //
                          // // clear data after add new data
                        //  ClearInpust();
                          SuccessSnack(context: context,title: 'دریافت شد');

                        }else{
                          ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');
                        }
                      },
                      child:Icon(Icons.add,color: primary_title,),
                    ),


                  ],
                ),
              );
            }),
          )),
    );
  }
}
