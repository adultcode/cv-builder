import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/menu/drawer_menu.dart';

class LanguageSmall extends StatefulWidget {
  const LanguageSmall({Key? key}) : super(key: key);

  @override
  State<LanguageSmall> createState() => _LanguageSmallState();
}

class _LanguageSmallState extends State<LanguageSmall> {

  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<LanguageVM>(context, listen: false).GetlanguageListData();
    });
  }



  @override
  Widget build(BuildContext context) {
    return DashboarHelper(
      drawer: MobileDrawer(),
      appBar: AppBar(
          title:      Text("زبان"),
          centerTitle: true,
          surfaceTintColor: panel_orange,
          primary: true,
          shadowColor: Colors.black54,

          leadingWidth: 55,
          leading:        InkWell(
            onTap: () async{

              var _result = await  Provider.of<LanguageVM>(context,listen: false).SavelanguageList();

              if(_result==true){
                if(Provider.of<LanguageVM>(context,listen: false).languageList==null ||
                    Provider.of<LanguageVM>(context,listen: false).languageList?.lang_list?.isEmpty==true)
                  SuccessSnack(context: context,title: 'لیست زبان شما خالی است');
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
      body: Container(
          height: sl<ScreenSize>().height,
          padding: EdgeInsets.symmetric(
              vertical: sl<ScreenSize>().height * 0.02,
              horizontal: sl<ScreenSize>().width * 0.02),
          child: SingleChildScrollView(
            child: Consumer<LanguageVM>(builder: (context, value, child) {
              if (value.selected_lang != null &&
                  value.selected_lang?.title != null) {

              }
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [


                   // SizedBox(height: 10,),
                    Text('مهارت های زبانی خود را در این قسمت میتوانید ثبت کنید ',style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: 30,),




                        /*
                        language title field
                         */
                         Container(
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
                                    hint: 'انگلیسی',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)),
                              ),
                            ),


                    SizedBox(height: 20,),


                    /*
                        grade field
                         */
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            //  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            backgroundColor: primary_container,

                          ),
                          child: Icon(Icons.add,color: primary_title,),
                          onPressed: () {
                            if (_formKey.currentState!.validate()){
                              Provider.of<LanguageVM>(context,listen: false).AddLanguage();
                              //   ClearInpust();

                            }
                          },
                        ),
                        SizedBox(width: sl<ScreenSize>().width * 0.3,),
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
                                items: <double>[1,2,3,4,5]
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

                    /*
                      list of language items
                       */
                    SizedBox(height: sl<ScreenSize>().height*0.05,),
                    if(value.lang_items!=null)
                      Wrap(
                        spacing: 11, // Add spacing between items
                        runSpacing: 11, // Add spacing between rows
                        alignment: WrapAlignment.end,
                        children: value.lang_items!,
                      )
                  ],
                ),
              );
            }),
          )),
    );
  }
}
