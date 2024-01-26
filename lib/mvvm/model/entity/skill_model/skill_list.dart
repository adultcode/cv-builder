import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'skill_list.freezed.dart';
part 'skill_list.g.dart';

@unfreezed
class SkillList with _$SkillList{

  factory SkillList({
    List<SkillModel?>? skill_list
  }) = _SkillList;

  factory SkillList.fromJson(Map<String, Object?> json)
  => _$SkillListFromJson(json);
}