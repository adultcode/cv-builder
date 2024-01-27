import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';

class LanguageBig extends StatefulWidget {
  const LanguageBig({Key? key}) : super(key: key);

  @override
  State<LanguageBig> createState() => _LanguageBigState();
}

class _LanguageBigState extends State<LanguageBig> {

var _title_controller = TextEditingController();
final _formKey = GlobalKey<FormState>();

var dropdownValue = 1.0;


@override
void initState() {
  // TODO: implement initState
  super.initState();

  WidgetsFlutterBinding.ensureInitialized()
      .scheduleFrameCallback((timeStamp) {
    Provider.of<LanguageVM>(context, listen: false).GetlanguageListData();
  });
}

void PopulateInputs(LanguageModel languageModel) {
  _title_controller.text = languageModel.title!;
}

void ClearInpust() {
  _title_controller.clear();
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
              PopulateInputs(value.selected_lang!);
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
                          if (value.languageList?.lang_list!=null) {
                            Provider.of<LanguageVM>(context,listen: false).SavelanguageList(languageList: value.languageList!);
                            SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');
                            // print("Size of total works: ${value.educationList?.educationList?.length}");


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
                      Text('زبان',style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),

                  SizedBox(height: 10,),
                  Text('مهارت های زبانی خود را در این قسمت میتوانید ثبت کنید ',style: Theme.of(context).textTheme.bodyMedium,),
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
                              Expanded(child: ElevatedButton(
                                child: Text("ثبت"),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()){
                                    Provider.of<LanguageVM>(context,listen: false).AddLanguage(language_model: LanguageModel(
                                        title: _title_controller.text,
                                        percent: dropdownValue.toInt()
                                    ));
                                    ClearInpust();
                                  }
                                },
                              )),
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
                                      value: dropdownValue,
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
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
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
                              controller: _title_controller,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: input_text_decoration(
                                  controller: _title_controller,
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
        ));
  }
}
