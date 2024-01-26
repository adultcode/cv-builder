// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillModelImpl _$$SkillModelImplFromJson(Map<String, dynamic> json) =>
    _$SkillModelImpl(
      title: json['title'] as String?,
      percent: (json['percent'] as num?)?.toDouble(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$SkillModelImplToJson(_$SkillModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'percent': instance.percent,
      'id': instance.id,
    };
