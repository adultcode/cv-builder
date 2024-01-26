// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkillList _$SkillListFromJson(Map<String, dynamic> json) {
  return _SkillList.fromJson(json);
}

/// @nodoc
mixin _$SkillList {
  List<SkillModel?>? get skill_list => throw _privateConstructorUsedError;
  set skill_list(List<SkillModel?>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillListCopyWith<SkillList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillListCopyWith<$Res> {
  factory $SkillListCopyWith(SkillList value, $Res Function(SkillList) then) =
      _$SkillListCopyWithImpl<$Res, SkillList>;
  @useResult
  $Res call({List<SkillModel?>? skill_list});
}

/// @nodoc
class _$SkillListCopyWithImpl<$Res, $Val extends SkillList>
    implements $SkillListCopyWith<$Res> {
  _$SkillListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill_list = freezed,
  }) {
    return _then(_value.copyWith(
      skill_list: freezed == skill_list
          ? _value.skill_list
          : skill_list // ignore: cast_nullable_to_non_nullable
              as List<SkillModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillListImplCopyWith<$Res>
    implements $SkillListCopyWith<$Res> {
  factory _$$SkillListImplCopyWith(
          _$SkillListImpl value, $Res Function(_$SkillListImpl) then) =
      __$$SkillListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SkillModel?>? skill_list});
}

/// @nodoc
class __$$SkillListImplCopyWithImpl<$Res>
    extends _$SkillListCopyWithImpl<$Res, _$SkillListImpl>
    implements _$$SkillListImplCopyWith<$Res> {
  __$$SkillListImplCopyWithImpl(
      _$SkillListImpl _value, $Res Function(_$SkillListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skill_list = freezed,
  }) {
    return _then(_$SkillListImpl(
      skill_list: freezed == skill_list
          ? _value.skill_list
          : skill_list // ignore: cast_nullable_to_non_nullable
              as List<SkillModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillListImpl with DiagnosticableTreeMixin implements _SkillList {
  _$SkillListImpl({this.skill_list});

  factory _$SkillListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillListImplFromJson(json);

  @override
  List<SkillModel?>? skill_list;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillList(skill_list: $skill_list)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SkillList'))
      ..add(DiagnosticsProperty('skill_list', skill_list));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillListImplCopyWith<_$SkillListImpl> get copyWith =>
      __$$SkillListImplCopyWithImpl<_$SkillListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillListImplToJson(
      this,
    );
  }
}

abstract class _SkillList implements SkillList {
  factory _SkillList({List<SkillModel?>? skill_list}) = _$SkillListImpl;

  factory _SkillList.fromJson(Map<String, dynamic> json) =
      _$SkillListImpl.fromJson;

  @override
  List<SkillModel?>? get skill_list;
  set skill_list(List<SkillModel?>? value);
  @override
  @JsonKey(ignore: true)
  _$$SkillListImplCopyWith<_$SkillListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
