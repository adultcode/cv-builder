
import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/language/language_list.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';

import 'education_model/education_model.dart';
import 'work_model/work_model.dart';
import 'info_model/info_model.dart';
import 'skill_model/skill_model.dart';
import 'social_model/social_model.dart';

class UserModel{

  EducationList? educations;
  LanguageList? languageList;
  WorklList? works;
 SkillList? skills;
  SocialList? socials;

  InfoModel? infoModel;
  UserModel(
      {
        this.educations,
      this.works,
      this.skills,
      this.socials,
      this.infoModel,
      this.languageList,
      });
}