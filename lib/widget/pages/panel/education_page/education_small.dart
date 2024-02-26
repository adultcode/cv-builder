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
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';
import '../../../custom_widgets/panel/menu/drawer_menu.dart';
import '../dashboard_page.dart';
import '../home_page/home_small.dart';

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

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<EducationVM>(context, listen: false).GetEducationListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v) async {
        Provider.of<MenuVM>(context, listen: false).setActiveItem(0);
        //   return false;
      },
      child: DashboarHelper(
        appBar: AppBar(
            title: Text(StringConst.ed_pagetitle),
            centerTitle: true,
            surfaceTintColor: panel_orange,
            primary: true,
            shadowColor: Colors.black54,
            leadingWidth: 55,
            leading: InkWell(
              onTap: () async {
                var _result =
                    await Provider.of<EducationVM>(context, listen: false)
                        .SaveEducationList();
                if (_result == true) {
                  if (Provider.of<EducationVM>(context, listen: false)
                              .educationList ==
                          null ||
                      Provider.of<EducationVM>(context, listen: false)
                              .educationList
                              ?.educationList
                              ?.isEmpty ==
                          true)
                    SuccessSnack(context: context, title: StringConst.ed_empty);
                  else
                    SuccessSnack(
                        context: context, title: StringConst.success_submit);
                } else {
                  ErrorSnack(context: context, title: StringConst.error);
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: sl<ScreenSize>().width * 0.04),
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
                          blurRadius: 5)
                    ]),
                child: Icon(
                  Icons.done,
                  size: 20,
                  color: panel_green,
                ),
              ),
            )),
        drawer: MobileDrawer(),
        body: Container(
            height: sl<ScreenSize>().height,
            padding: EdgeInsets.symmetric(
                vertical: sl<ScreenSize>().height * 0.02,
                horizontal: sl<ScreenSize>().width * 0.02),
            child: SingleChildScrollView(
              child: Consumer<EducationVM>(builder: (context, value, child) {
                if (value.selected_education != null &&
                    value.selected_education?.title != null) {
                  //PopulateInputs(value.selected_education!);
                }
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        StringConst.ed_subtitle,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      /*
                         work list view
                           */

                      if (value.education_items != null)
                        ...value.education_items!

                      /*
                    first row
                    title and grade field
                     */

                      ,
                      SizedBox(
                        height: 20,
                      ),

                      /*
                        grade field
                         */
                      InputLabel(
                        hint: StringConst.ed_grade_hint,
                        name: StringConst.ed_grade,
                        textEditingController: value.grade_controller,
                      ),
                      SizedBox(height: sl<ScreenSize>().height * 0.02),

                      /*
                        education title field
                         */
                      InputLabel(
                        hint: StringConst.ed_title_hint,
                        name: StringConst.ed_title,
                        textEditingController: value.title_controller,
                      ),
                      SizedBox(height: sl<ScreenSize>().height * 0.02),

                      /*
                    sec row
                    university and description field
                     */

                      /*
                              grade field
                               */
                      InputLabel(
                        hint: StringConst.ed_uni_hint,
                        name: StringConst.ed_uni,
                        textEditingController: value.university_controller,
                      ),
                      SizedBox(height: sl<ScreenSize>().height * 0.02),

                      /*
                        education title field
                         */
                      InputLabel(
                        hint: StringConst.desc,
                        name: StringConst.ed_desc,
                        textEditingController: value.desc_controller,
                        isOption: true,
                      ),
                      SizedBox(height: sl<ScreenSize>().height * 0.02),

                      /*
                    third row
                    start and end date field
                     */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /*
                        company field
                         */
                          Expanded(
                              child: InputLabel(
                            hint: '1402/02/01',
                            name: StringConst.date_end,
                            textEditingController: value.end_controller,
                          )),
                          SizedBox(width: sl<ScreenSize>().width * 0.05),

                          /*
                        job title field
                         */
                          Expanded(
                              child: InputLabel(
                            hint: '1402/01/02',
                            name: StringConst.date_start,
                            textEditingController: value.start_controller,
                          )),
                        ],
                      ),
                      SizedBox(height: sl<ScreenSize>().height * 0.04),

                      /*
                      save button
                       */
                      Container(
                        width: min_icon_width,
                        height: min_icon_width,
                        //   alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primary_container),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          color: primary_title,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // add new work model in list of work models

                              Provider.of<EducationVM>(context, listen: false)
                                  .AddEducation();
                              // SuccessSnack(context: context,title: 'دریافت شد');
                            } else {
                              ErrorSnack(
                                  context: context,
                                  title: StringConst.fill_all);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )),
      ),
    );
  }
}
