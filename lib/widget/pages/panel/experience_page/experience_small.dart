
import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/mvvm/viewmodel/work_viewmodel.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/drawer_menu.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';
import '../home_page/home_small.dart';

class ExperienceSmall extends StatefulWidget {

  @override
  State<ExperienceSmall> createState() => _ExperienceSmallState();
}

class _ExperienceSmallState extends State<ExperienceSmall> {


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


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v)async {
   //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageSmall(),));
        Provider.of<MenuVM>(context,listen: false).setActiveItem(0);
        //   return false;
      },
      child: DashboarHelper(
        appBar: AppBar(
          title:      Text(AppLocale.work_title.getString(context)),
          centerTitle: true,
            surfaceTintColor: panel_orange,
            primary: true,
            shadowColor: Colors.black54,

            leadingWidth: 55,
            leading:        InkWell(
              onTap: () async{

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
                  value.PopulateInputs();
                }
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Text( AppLocale.work_subtitle.getString(context),
                        textDirection: TextDirection.rtl,

                        style: Theme.of(context).textTheme.bodyMedium,),
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


                          /*
                        company field
                         */
                      InputLabel(hint: AppLocale.company_hint.getString(context),name: AppLocale.company_title.getString(context),textEditingController: value.company_controller,),

                          SizedBox(height: sl<ScreenSize>().height*0.02),

                          /*
                        job title field
                         */
                       InputLabel(hint: AppLocale.job_hint.getString(context),name: AppLocale.job_title.getString(context),textEditingController: value.title_controller,),

                      /*
                    second row
                    start and end date field
                     */
                      SizedBox(height: sl<ScreenSize>().height*0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          /*
                        end date
                         */
                          Expanded(
                              child: InputLabel(hint: '1402/02/01',name: AppLocale.date_end.getString(context),textEditingController: value.end_controller,)
                          ),
                          SizedBox(width: sl<ScreenSize>().width*0.05),

                          /*
                        start date
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
                          Container(
                            width:min_icon_width,
                            height: min_icon_width,
                            //   alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary_container
                            ),
                            child: IconButton(icon:Icon(Icons.add),color: primary_title,
                              padding: EdgeInsets.zero,
                              onPressed: () {

                                if (_formKey.currentState!.validate()){
                                  // add new work model in list of work models
                                  Provider.of<WorkVM>(context,listen: false).AddWork();
                                }else{
                                  ErrorSnack(context: context,title: AppLocale.fill_all.getString(context));
                                }
                              },),

                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: sl<ScreenSize>().width*0.03),
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
      ),
    );
  }
}
