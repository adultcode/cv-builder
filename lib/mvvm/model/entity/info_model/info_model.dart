import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'info_model.freezed.dart';
part 'info_model.g.dart';

@unfreezed
class InfoModel with _$InfoModel{


  factory InfoModel({
     String? name,

     String? email,
     String? mobile,
     String? job,
     String? bio,
  }) = _InfoModel;


  factory InfoModel.fromJson(Map<String, Object?> json)
  => _$InfoModelFromJson(json);

}