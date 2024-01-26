import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@unfreezed

class SkillModel with _$SkillModel{




  factory SkillModel({
    String? title,
    double? percent,
    int? id,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, Object?> json)
  => _$SkillModelFromJson(json);
}