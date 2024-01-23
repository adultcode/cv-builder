// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkModelImpl _$$WorkModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkModelImpl(
      title: json['title'] as String?,
      start_date: json['start_date'] as String?,
      end_date: json['end_date'] as String?,
      company: json['company'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$WorkModelImplToJson(_$WorkModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'company': instance.company,
      'description': instance.description,
      'id': instance.id,
    };
