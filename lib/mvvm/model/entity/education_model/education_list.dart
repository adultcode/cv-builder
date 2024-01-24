import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_list.freezed.dart';
part 'education_list.g.dart';

@unfreezed

class EducationList with _$EducationList{
  factory EducationList({
    List<EducationModel?>? educationList
  }) = _EducationList;


  factory EducationList.fromJson(Map<String, Object?> json)
  => _$EducationListFromJson(json);
}