import 'package:flutter/material.dart';

import '../../../util/constant/color.dart';
import '../../../util/constant/widget_decoration.dart';


class InputLabel extends StatelessWidget {

  String hint;
  String name;
  TextEditingController? textEditingController;
  InputLabel({required  this.name,required  this.hint,this.textEditingController});

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
            child: TextField(
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
