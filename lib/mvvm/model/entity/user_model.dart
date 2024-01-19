
import 'education_model.dart';
import 'experience_model.dart';
import 'info_model/info_model.dart';
import 'skill_model.dart';
import 'social_model/social_model.dart';

class UserModel{

  List<EducationModel>? educations;
  List<ExperienceModel>? experiences;
  List<SkillModel>? skills;
  List<SocialModel?>? socials;

  InfoModel? infoModel;
  UserModel(
      {
        this.educations,
      this.experiences,
      this.skills,
      this.socials,
      this.infoModel,
      });
}