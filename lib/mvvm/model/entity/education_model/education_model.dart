import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_model.freezed.dart';
part 'education_model.g.dart';

@unfreezed

class EducationModel with _$EducationModel{



  factory EducationModel({
    String? title,
    String? grade,
    String? start_date,
    String? end_date,
    String? university,
    String? description,
    int? id,
  }) = _EducationModel;

  factory EducationModel.fromJson(Map<String, Object?> json)
  => _$EducationModelFromJson(json);

}