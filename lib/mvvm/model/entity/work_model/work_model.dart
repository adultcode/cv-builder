import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_model.freezed.dart';
part 'work_model.g.dart';

@unfreezed
class WorkModel with _$WorkModel{



  factory WorkModel({
    String? title,
    String? start_date,
    String? end_date,
    String? company,
    String? description,
  }) = _WorkModel;

  factory WorkModel.fromJson(Map<String, Object?> json)
  => _$WorkModelFromJson(json);
}