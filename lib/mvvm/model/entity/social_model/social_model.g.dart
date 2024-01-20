// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialModelImpl _$$SocialModelImplFromJson(Map<String, dynamic> json) =>
    _$SocialModelImpl(
      address: json['address'] as String?,
      icon_path: json['icon_path'] as String?,
      socialType: $enumDecodeNullable(_$SocialTypeEnumMap, json['socialType']),
    );

Map<String, dynamic> _$$SocialModelImplToJson(_$SocialModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'icon_path': instance.icon_path,
      'socialType': _$SocialTypeEnumMap[instance.socialType],
    };

const _$SocialTypeEnumMap = {
  SocialType.linkedin: 'linkedin',
  SocialType.github: 'github',
  SocialType.telegram: 'telegram',
  SocialType.dribble: 'dribble',
  SocialType.other: 'other',
  SocialType.instagram: 'instagram',
};
