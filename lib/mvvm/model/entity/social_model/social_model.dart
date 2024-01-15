import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'social_model.freezed.dart';
part 'social_model.g.dart';

@unfreezed
class SocialModel with _$SocialModel{

  factory SocialModel({
    String? address,
    String? icon_path,
    SocialType? socialType,
  }) = _SocialModel;

  factory SocialModel.fromJson(Map<String, Object?> json)
  => _$SocialModelFromJson(json);
}


enum SocialType{
  linkedin,
  github,
  telegram,
  dribble,
  other,
  instagram
}