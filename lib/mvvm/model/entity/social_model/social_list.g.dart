// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialListImpl _$$SocialListImplFromJson(Map<String, dynamic> json) =>
    _$SocialListImpl(
      socialModels: (json['socialModels'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SocialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SocialListImplToJson(_$SocialListImpl instance) =>
    <String, dynamic>{
      'socialModels': instance.socialModels,
    };
