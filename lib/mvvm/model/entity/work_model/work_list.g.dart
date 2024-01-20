// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorklListImpl _$$WorklListImplFromJson(Map<String, dynamic> json) =>
    _$WorklListImpl(
      workModels: (json['workModels'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : WorkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorklListImplToJson(_$WorklListImpl instance) =>
    <String, dynamic>{
      'workModels': instance.workModels,
    };
