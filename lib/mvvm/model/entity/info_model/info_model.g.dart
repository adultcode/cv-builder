// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfoModelImpl _$$InfoModelImplFromJson(Map<String, dynamic> json) =>
    _$InfoModelImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as int?,
      job: json['job'] as String?,
      bio: json['bio'] as String?,
      city: json['city'] as String?,
      birth: json['birth'] as String?,
    );

Map<String, dynamic> _$$InfoModelImplToJson(_$InfoModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'job': instance.job,
      'bio': instance.bio,
      'city': instance.city,
      'birth': instance.birth,
    };
