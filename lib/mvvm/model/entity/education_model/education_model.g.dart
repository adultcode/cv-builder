// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationModelImpl _$$EducationModelImplFromJson(Map<String, dynamic> json) =>
    _$EducationModelImpl(
      title: json['title'] as String?,
      start_date: json['start_date'] as String?,
      end_date: json['end_date'] as String?,
      university: json['university'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$EducationModelImplToJson(
        _$EducationModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'university': instance.university,
      'description': instance.description,
      'id': instance.id,
    };
