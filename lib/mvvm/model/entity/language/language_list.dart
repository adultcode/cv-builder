import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'language_list.freezed.dart';
part 'language_list.g.dart';

@unfreezed
class LanguageList with _$LanguageList{

  factory LanguageList({
    List<LanguageModel?>? lang_list
  }) = _LanguageList;

  factory LanguageList.fromJson(Map<String, Object?> json)
  => _$LanguageListFromJson(json);
}