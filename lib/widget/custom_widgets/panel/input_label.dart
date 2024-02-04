import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../util/constant/color.dart';
import '../../../util/constant/widget_decoration.dart';


class InputLabel extends StatelessWidget {

  String hint;
  String name;
  TextEditingController? textEditingController;
  bool? isNumber;
  bool? isOption;
  int? max_length;

  InputLabel({required  this.name,required  this.hint,this.textEditingController,this.isNumber,
  this.isOption,this.max_length});

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
            alignment: Alignment.centerRight,
            decoration: input_decoration,
            child: TextFormField(
              maxLength: max_length,
              textAlignVertical : TextAlignVertical.center,
              cursorColor: Colors.black,
              enabled: true,
              keyboardType: isNumber!=null?TextInputType.number:TextInputType.text,
              inputFormatters: isNumber!=null?[
                FilteringTextInputFormatter.digitsOnly
              ]:null,
              validator: (value) {
                if (value?.isEmpty==true &&isOption==null) {
                  return 'Please enter some text';
                }
                // if(isOption!=null && isOption==true) {
                // print("$hint: $isOption");
                //   return null;
                // }

                return null;
              },
              controller: textEditingController,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: input_text_decoration(
                  controller: textEditingController!,
                  hint: hint!,

                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey)),
            ),
          )
        ],
      ),
    );
  }
}
