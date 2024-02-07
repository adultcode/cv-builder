import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../config/locator.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/widget_decoration.dart';


class InputForm extends StatelessWidget {

  String hint;
  String name;
  TextEditingController? textEditingController;
  InputForm({required  this.name,required  this.hint,this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 100,
      //width: 150,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(name!,style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.topRight,
            decoration: input_decoration,
            height:  sl<ScreenSize>().width<ScreenSize.smallwidth? sl<ScreenSize>().height*0.17
                : sl<ScreenSize>().height*0.25,
            child: TextFormField(
              maxLines: 10,
           //   maxLength: 500,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: textEditingController,

              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: input_text_decoration(
                  controller: textEditingController!,
                  hint: hint!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)
              ),
            ),
          )
        ],
      ),
    );
  }
}
