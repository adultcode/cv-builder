import 'package:cv_builder/mvvm/viewmodel/work_viewmodel.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';

class ExperienceBig extends StatefulWidget {

  @override
  State<ExperienceBig> createState() => _ExperienceBigState();
}

class _ExperienceBigState extends State<ExperienceBig> {


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
  // void PopulateInputs(WorkModel workModel){
  //   _title_controller.text = workModel.title!;
  //   _company_controller.text = workModel.company!;
  //   _start_controller.text = workModel.start_date!;
  //   _end_controller.text = workModel.end_date!;
  //   _desc_controller.text = workModel.description!;
  // }
  //
  // void ClearInpust(){
  //   _title_controller.clear();
  //   _company_controller.clear();
  //   _start_controller.clear();
  //   _end_controller.clear();
  //   _desc_controller.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return DashboarHelper(
      body: Container(
          height: sl<ScreenSize>().height,
          decoration: panel_container_decoration,
          padding: EdgeInsets.symmetric(
              vertical: sl<ScreenSize>().height * 0.02,
              horizontal: sl<ScreenSize>().width * 0.02),
          child: SingleChildScrollView(
            child: Consumer<WorkVM>(builder: (context, value, child) {
              if(value.selected_workmodel!=null && value.selected_workmodel?.title!=null){
                value.PopulateInputs();
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
                            var _result = await  Provider.of<WorkVM>(context,listen: false).SaveWorkList();

                            if(_result==true){
                              if(Provider.of<WorkVM>(context,listen: false).worklList==null ||
                                  Provider.of<WorkVM>(context,listen: false).worklList?.workModels?.isEmpty==true)
                                SuccessSnack(context: context,title: AppLocale.work_empty.getString(context));
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
                        Text(AppLocale.work_title.getString(context),style: Theme.of(context).textTheme.titleLarge,)
      
                      ],
                    ),
      
                    SizedBox(height: 10,),
                    Text(AppLocale.work_subtitle.getString(context),style: Theme.of(context).textTheme.bodyMedium,),
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
                   , SizedBox(height: sl<ScreenSize>().height*0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: sl<ScreenSize>().width*0.05),
      
                        /*
                      company field
                       */
                        Expanded(
                            child: InputLabel(hint: AppLocale.company_hint.getString(context),name: AppLocale.company_title.getString(context),textEditingController: value.company_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
      
                        /*
                      job title field
                       */
                        Expanded(
                            child: InputLabel(hint: AppLocale.job_hint.getString(context),name: AppLocale.job_title.getString(context),textEditingController: value.title_controller,)
                        ),
      
      
      
                      ],
                    ),
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
                            child: InputLabel(hint: '1402/02/01',name: AppLocale.date_end.getString(context),textEditingController: value.end_controller,)
                        ),
                        SizedBox(width: sl<ScreenSize>().width*0.05),
      
                        /*
                      job title field
                       */
                        Expanded(
                            child: InputLabel(hint: '1402/01/02',name: AppLocale.date_start.getString(context),textEditingController: value.start_controller,)
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  primary_container,
                        ),
                        onPressed: () {

                          if (_formKey.currentState!.validate()){
                            // add new work model in list of work models
                            Provider.of<WorkVM>(context,listen: false).AddWork();
                          }else{
                            ErrorSnack(context: context,title: AppLocale.fill_all.getString(context));
                          }
                        },
                        child: Text( AppLocale.add.getString(context),
                            style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title)),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: sl<ScreenSize>().width*0.25),
                            child: InputForm(hint: AppLocale.desc_hint.getString(context),name: AppLocale.desc.getString(context),textEditingController: value.desc_controller,)
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
