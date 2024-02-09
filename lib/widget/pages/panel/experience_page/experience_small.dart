import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/mvvm/viewmodel/work_viewmodel.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/drawer_menu.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';

class ExperienceSmall extends StatefulWidget {

  @override
  State<ExperienceSmall> createState() => _ExperienceSmallState();
}

class _ExperienceSmallState extends State<ExperienceSmall> {

  var _title_controller = TextEditingController();
  var _company_controller = TextEditingController();
  var _start_controller = TextEditingController();
  var _end_controller = TextEditingController();
  var _desc_controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WorkVM>(context,listen: false).GetWorkListData();
    // GetData();
  }

  void GetData() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences.getString(StringConst.work_key);
    print(result);

  }
  void PopulateInputs(WorkModel workModel){
    _title_controller.text = workModel.title!;
    _company_controller.text = workModel.company!;
    _start_controller.text = workModel.start_date!;
    _end_controller.text = workModel.end_date!;
    _desc_controller.text = workModel.description!;
  }

  void ClearInpust(){
    _title_controller.clear();
    _company_controller.clear();
    _start_controller.clear();
    _end_controller.clear();
    _desc_controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DashboarHelper(
      appBar: AppBar(
        title:      Text("تجربه های کاری"),
        centerTitle: true,
          surfaceTintColor: panel_orange,
          primary: true,
          shadowColor: Colors.black54,

          leadingWidth: 55,
          leading:        InkWell(
            onTap: () async{
              if(_formKey.currentState?.validate()==true){
                // var resul = await     Provider.of<InfoVM>(context,listen: false).SaveInfoData();
                // if(resul==true)     SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');
                //
                // else     ErrorSnack(context: context,title: 'خطایی رخ داده است');

              }
              else{
                ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');
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
          decoration: panel_container_decoration,
          padding: EdgeInsets.symmetric(
              vertical: sl<ScreenSize>().height * 0.02,
              horizontal: sl<ScreenSize>().width * 0.02),
          child: SingleChildScrollView(
            child: Consumer<WorkVM>(builder: (context, value, child) {
              if(value.selected_workmodel!=null && value.selected_workmodel?.title!=null){
                PopulateInputs(value.selected_workmodel!);
              }
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    SizedBox(height: 10,),
                    Text('لیست سوابق کاری خود را در این قسمت ثبت کنید ',style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 30,),

                    /*
                       work list view
                         */

                    if(value.work_items!=null)
                      ...value.work_items!


                    /*
                  first row
                  title and company field
                   */
              ,SizedBox(height: 20,),

                      //  SizedBox(width: sl<ScreenSize>().width*0.05),

                        /*
                      company field
                       */
                         InputLabel(hint: 'گوگل',name: 'نام شرکت',textEditingController: _company_controller,),

                        SizedBox(height: sl<ScreenSize>().height*0.02),

                        /*
                      job title field
                       */
                        InputLabel(hint: 'برنامه نویس',name: 'عنوان شغل',textEditingController: _title_controller,),


                    SizedBox(height: sl<ScreenSize>().height*0.04),

                    /*
                  second row
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
                    description input
                     */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        SizedBox(width: sl<ScreenSize>().width*0.05),
                        Container(
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                            //  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              backgroundColor: primary_btn,

                            ),
                            onPressed: () {

                              if (_formKey.currentState!.validate()){
                                // add new work model in list of work models
                                // var wo = WorkModel(title:_title_controller.text,



                                Provider.of<WorkVM>(context,listen: false).AddWork(work: WorkModel(title:_title_controller.text,
                                    company: _company_controller.text,
                                    description: _desc_controller.text,
                                    start_date: _start_controller.text,
                                    end_date: _end_controller.text) );

                                // clear data after add new data
                                ClearInpust();

                              }else{
                                ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');
                              }
                            },
                            child: Icon(Icons.add),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: sl<ScreenSize>().width*0.03),
                              child: InputForm(hint: 'توضیحات موقعیت شغلی',name: 'توضیحات',textEditingController: _desc_controller,)
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              );
            }),
          )),
    );
  }
}
