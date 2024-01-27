import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../util/constant/color.dart';

class LanguageItem extends StatelessWidget {

  LanguageModel languageModel;

  LanguageItem({required this.languageModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      // color: Colors.green,
      child: InputChip(
        backgroundColor: work_background,
        elevation: 4,
        shape: const StadiumBorder(
          side: BorderSide(style: BorderStyle.none),
        ),
        deleteIcon: Icon(Icons.close,size: 18,),
        onDeleted: () {
          Provider.of<LanguageVM>(context,listen: false).DeleteLang(languageModel);

        },
        label: Text("${languageModel.title}  - سطح  ${languageModel.percent} "),
        //  avatar: Icon(Icons.remove),
        onPressed: () {
          print(languageModel.title!);
          Provider.of<LanguageVM>(context,listen: false).SelectLangModel(languageModel);

        },

      ),
    );
  }
}
