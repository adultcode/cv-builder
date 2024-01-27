// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageListImpl _$$LanguageListImplFromJson(Map<String, dynamic> json) =>
    _$LanguageListImpl(
      lang_list: (json['lang_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LanguageListImplToJson(_$LanguageListImpl instance) =>
    <String, dynamic>{
      'lang_list': instance.lang_list,
    };
