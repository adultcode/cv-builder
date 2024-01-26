import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/viewmodel/skill_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../util/constant/color.dart';

class SkillItem extends StatelessWidget {

  SkillModel skillModell;

  SkillItem({required this.skillModell});

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
          Provider.of<SkillVM>(context,listen: false).DeleteSkill(skillModell);

        },
        label: Text("${skillModell.title} "),
      //  avatar: Icon(Icons.remove),
        onPressed: () {
          print(skillModell.title!);
          Provider.of<SkillVM>(context,listen: false).SelectSkillModel(skillModell);

        },

      ),
    );
  }
}
