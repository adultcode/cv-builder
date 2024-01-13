
import '../mvvm/model/entity/education_model.dart';
import '../mvvm/model/entity/experience_model.dart';
import '../mvvm/model/entity/info_model/info_model.dart';
import '../mvvm/model/entity/skill_model.dart';
import '../mvvm/model/entity/social_model.dart';

class UserModel{

  List<EducationModel>? educations;
  List<ExperienceModel>? experiences;
  List<SkillModel>? skills;
  List<SocialModel>? socials;

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