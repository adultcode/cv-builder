import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'social_list.freezed.dart';
part 'social_list.g.dart';

@unfreezed
class SocialList with _$SocialList{

  // String? address;
  // String? icon_path;
  // SocialType? socialType;
  //
  // SocialModel(  {this.address, this.socialType,this.icon_path});
  factory SocialList({
    List<SocialModel?>?socialModels
  }) = _SocialList;

  factory SocialList.fromJson(Map<String, Object?> json)
  => _$SocialListFromJson(json);
}

