import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';

class LanguageBig extends StatefulWidget {
  const LanguageBig({Key? key}) : super(key: key);

  @override
  State<LanguageBig> createState() => _LanguageBigState();
}

class _LanguageBigState extends State<LanguageBig> {

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
    return Container(
        height: sl<ScreenSize>().height,
        decoration: panel_container_decoration,
        padding: EdgeInsets.symmetric(
            vertical: sl<ScreenSize>().height * 0.02,
            horizontal: sl<ScreenSize>().width * 0.02),
        child: SingleChildScrollView(
          child: Consumer<LanguageVM>(builder: (context, value, child) {
            if (value.selected_lang != null &&
                value.selected_lang?.title != null) {
             // PopulateInputs(value.selected_lang!);
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
                          var _result = await  Provider.of<LanguageVM>(context,listen: false).SavelanguageList();

                          if(_result==true){
                            if(Provider.of<LanguageVM>(context,listen: false).languageList==null ||
                                Provider.of<LanguageVM>(context,listen: false).languageList?.lang_list?.isEmpty==true)
                              SuccessSnack(context: context,title: StringConst.lang_isempty);
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
                      Text(StringConst.language,style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(StringConst.lang_subtitle,style: Theme.of(context).textTheme.bodyMedium,),
                  SizedBox(height: 30,),


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
                              Container(
                                width:min( sl<ScreenSize>().width*0.04,36),
                                height: min( sl<ScreenSize>().width*0.04,36),
                               //   alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary_container
                                ),
                                  child: IconButton(icon:Icon(Icons.add),color: primary_title,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Provider.of<LanguageVM>(context,listen: false).AddLanguage();
                                  },),

                                ),
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
                                  hint: 'انگلیسی',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)),
                            ),
                          )
                      ),



                    ],
                  ),

                  /*
                    list of language items
                     */
                  SizedBox(height: sl<ScreenSize>().height*0.05,),
                  if(value.lang_items!=null)
                    ...value.lang_items!
                    // Wrap(
                    //   spacing: 11, // Add spacing between items
                    //   runSpacing: 11, // Add spacing between rows
                    //   alignment: WrapAlignment.end,
                    //   children: value.lang_items!,
                    // )
                ],
              ),
            );
          }),
        ));
  }
}
