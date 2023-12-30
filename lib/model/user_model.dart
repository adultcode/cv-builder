import 'package:cv_builder/model/experience_model.dart';
import 'package:cv_builder/model/skill_model.dart';
import 'package:cv_builder/model/social_model.dart';

import 'education_model.dart';

class UserModel{

  List<EducationModel>? educations;
  List<ExperienceModel>? experiences;
  List<SkillModel>? skills;
  List<SocialModel>? socials;

  String? full_name;
  String? biography;

  UserModel(
      {
        this.educations,
      this.experiences,
      this.skills,
      this.socials,
      this.full_name,
      this.biography
      });
}