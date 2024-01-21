import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:cv_builder/mvvm/viewmodel/work_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';

class ExperienceBig extends StatefulWidget {

  @override
  State<ExperienceBig> createState() => _ExperienceBigState();
}

class _ExperienceBigState extends State<ExperienceBig> {

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
          child: Consumer<WorkVM>(builder: (context, value, child) {
            ////if(value.socialList!=null){
            // populate the inputs
            // PopulateInput(value.socialList!);
            // },
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
                          if (_formKey.currentState!.validate()) {
                          //  value.worklList = WorklList();
                            if(value.worklList?.workModels==null){
                              value.worklList = WorklList();
                              value.worklList?.workModels = [WorkModel(title:_title_controller.text,
                                  company: _company_controller.text,
                                  description: _desc_controller.text,
                                  start_date: _start_controller.text,
                                  end_date: _end_controller.text)];
                            }else{
                              value.worklList?.workModels?.add(WorkModel(title:_title_controller.text,
                                  company: _company_controller.text,
                                  description: _desc_controller.text,
                                  start_date: _start_controller.text,
                                  end_date: _end_controller.text));
                            }

                             // print("Work size from buld: ${value.worklList?.workModels?.length}");
                              Provider.of<WorkVM>(context,listen: false).SaveSocialList(work: value.worklList!);
                              SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');


                          }else{
                            ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');

                          }
                        //  SocialList socialList = SocialList(socialModels: GetInputData());
                         // value.worklList?.workModels?.add(WorkModel(title: ));
                          //Provider.of<WorkVM>(context,listen: false).SaveSocialList(work: value.worklList);

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
                      Text('تجربه های کاری',style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),

                  SizedBox(height: 10,),
                  Text('لیست سوابق کاری خود را در این قسمت ثبت کنید ',style: Theme.of(context).textTheme.bodyMedium,),
                  SizedBox(height: 30,),

                  /*
                     work list view
                       */

                  ...value.work_items!


                  /*
                first row
                title and company field
                 */
                  ,Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    company field
                     */
                      Expanded(
                          child: InputLabel(hint: 'گوگل',name: 'نام شرکت',textEditingController: _company_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),

                      /*
                    job title field
                     */
                      Expanded(
                          child: InputLabel(hint: 'برنامه نویس',name: 'عنوان شغل',textEditingController: _title_controller,)
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
                        onPressed: () {

                        },
                        child: Text("اضافه کردن"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: sl<ScreenSize>().width*0.05),
                          child: InputForm(hint: 'توضیحات موقعیت شغلی',name: 'توضیحات',textEditingController: _desc_controller,)
                      ),
                    ),

                  ],
                )

                ],
              ),
            );
          }),
        ));
  }
}
