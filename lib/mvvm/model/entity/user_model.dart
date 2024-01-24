
import 'education_model/education_model.dart';
import 'work_model/work_model.dart';
import 'info_model/info_model.dart';
import 'skill_model.dart';
import 'social_model/social_model.dart';

class UserModel{

  List<EducationModel>? educations;
  List<WorkModel>? works;
  List<SkillModel>? skills;
  List<SocialModel?>? socials;

  InfoModel? infoModel;
  UserModel(
      {
        this.educations,
      this.works,
      this.skills,
      this.socials,
      this.infoModel,
      });
}