import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'work_list.freezed.dart';
part 'work_list.g.dart';

@unfreezed
class WorklList with _$WorklList{

  factory WorklList({
    List<WorkModel?>?workModels
  }) = _WorklList;

  factory WorklList.fromJson(Map<String, Object?> json)
  => _$WorklListFromJson(json);
}

