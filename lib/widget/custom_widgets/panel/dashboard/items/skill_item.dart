import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {

  SkillModel skillModell;

  SkillItem({required this.skillModell});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      color: Colors.green,
      child: Text(skillModell.title!),
    );
  }
}
