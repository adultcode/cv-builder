// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillListImpl _$$SkillListImplFromJson(Map<String, dynamic> json) =>
    _$SkillListImpl(
      skill_list: (json['skill_list'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SkillListImplToJson(_$SkillListImpl instance) =>
    <String, dynamic>{
      'skill_list': instance.skill_list,
    };
