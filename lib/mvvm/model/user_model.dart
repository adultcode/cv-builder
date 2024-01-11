import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_model.freezed.dart';
// part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{

  // String? name;
  // String? email;
  // String? mobile;
  // String? job;
  // String? bio;

const factory UserModel({
  required String name,

  required String email,
  required String mobile,
  required String job,
  required String bio,
}) = _UserModel;

// factory UserModel.fromJson(Map<String, Object?> json)
//   => _$UserModelFromJson(json);

factory UserModel.fromJson(Map<String, Object?> json)
=> _$UserModelFromJson(json);

}