// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationListImpl _$$EducationListImplFromJson(Map<String, dynamic> json) =>
    _$EducationListImpl(
      educationList: (json['educationList'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EducationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EducationListImplToJson(_$EducationListImpl instance) =>
    <String, dynamic>{
      'educationList': instance.educationList,
    };
