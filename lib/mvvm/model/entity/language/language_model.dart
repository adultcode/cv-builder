
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@unfreezed

class LanguageModel with _$LanguageModel{




  factory LanguageModel({
    String? title,
    int? percent,
    int? id,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, Object?> json)
  => _$LanguageModelFromJson(json);
}