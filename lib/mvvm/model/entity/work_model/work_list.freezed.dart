// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorklList _$WorklListFromJson(Map<String, dynamic> json) {
  return _WorklList.fromJson(json);
}

/// @nodoc
mixin _$WorklList {
  List<WorkModel?>? get workModels => throw _privateConstructorUsedError;
  set workModels(List<WorkModel?>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorklListCopyWith<WorklList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorklListCopyWith<$Res> {
  factory $WorklListCopyWith(WorklList value, $Res Function(WorklList) then) =
      _$WorklListCopyWithImpl<$Res, WorklList>;
  @useResult
  $Res call({List<WorkModel?>? workModels});
}

/// @nodoc
class _$WorklListCopyWithImpl<$Res, $Val extends WorklList>
    implements $WorklListCopyWith<$Res> {
  _$WorklListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workModels = freezed,
  }) {
    return _then(_value.copyWith(
      workModels: freezed == workModels
          ? _value.workModels
          : workModels // ignore: cast_nullable_to_non_nullable
              as List<WorkModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorklListImplCopyWith<$Res>
    implements $WorklListCopyWith<$Res> {
  factory _$$WorklListImplCopyWith(
          _$WorklListImpl value, $Res Function(_$WorklListImpl) then) =
      __$$WorklListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WorkModel?>? workModels});
}

/// @nodoc
class __$$WorklListImplCopyWithImpl<$Res>
    extends _$WorklListCopyWithImpl<$Res, _$WorklListImpl>
    implements _$$WorklListImplCopyWith<$Res> {
  __$$WorklListImplCopyWithImpl(
      _$WorklListImpl _value, $Res Function(_$WorklListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workModels = freezed,
  }) {
    return _then(_$WorklListImpl(
      workModels: freezed == workModels
          ? _value.workModels
          : workModels // ignore: cast_nullable_to_non_nullable
              as List<WorkModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorklListImpl with DiagnosticableTreeMixin implements _WorklList {
  _$WorklListImpl({this.workModels});

  factory _$WorklListImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorklListImplFromJson(json);

  @override
  List<WorkModel?>? workModels;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WorklList(workModels: $workModels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WorklList'))
      ..add(DiagnosticsProperty('workModels', workModels));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorklListImplCopyWith<_$WorklListImpl> get copyWith =>
      __$$WorklListImplCopyWithImpl<_$WorklListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorklListImplToJson(
      this,
    );
  }
}

abstract class _WorklList implements WorklList {
  factory _WorklList({List<WorkModel?>? workModels}) = _$WorklListImpl;

  factory _WorklList.fromJson(Map<String, dynamic> json) =
      _$WorklListImpl.fromJson;

  @override
  List<WorkModel?>? get workModels;
  set workModels(List<WorkModel?>? value);
  @override
  @JsonKey(ignore: true)
  _$$WorklListImplCopyWith<_$WorklListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
