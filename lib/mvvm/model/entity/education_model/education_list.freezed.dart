// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EducationList _$EducationListFromJson(Map<String, dynamic> json) {
  return _EducationList.fromJson(json);
}

/// @nodoc
mixin _$EducationList {
  List<EducationModel?>? get educationList =>
      throw _privateConstructorUsedError;
  set educationList(List<EducationModel?>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationListCopyWith<EducationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationListCopyWith<$Res> {
  factory $EducationListCopyWith(
          EducationList value, $Res Function(EducationList) then) =
      _$EducationListCopyWithImpl<$Res, EducationList>;
  @useResult
  $Res call({List<EducationModel?>? educationList});
}

/// @nodoc
class _$EducationListCopyWithImpl<$Res, $Val extends EducationList>
    implements $EducationListCopyWith<$Res> {
  _$EducationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? educationList = freezed,
  }) {
    return _then(_value.copyWith(
      educationList: freezed == educationList
          ? _value.educationList
          : educationList // ignore: cast_nullable_to_non_nullable
              as List<EducationModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationListImplCopyWith<$Res>
    implements $EducationListCopyWith<$Res> {
  factory _$$EducationListImplCopyWith(
          _$EducationListImpl value, $Res Function(_$EducationListImpl) then) =
      __$$EducationListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EducationModel?>? educationList});
}

/// @nodoc
class __$$EducationListImplCopyWithImpl<$Res>
    extends _$EducationListCopyWithImpl<$Res, _$EducationListImpl>
    implements _$$EducationListImplCopyWith<$Res> {
  __$$EducationListImplCopyWithImpl(
      _$EducationListImpl _value, $Res Function(_$EducationListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? educationList = freezed,
  }) {
    return _then(_$EducationListImpl(
      educationList: freezed == educationList
          ? _value.educationList
          : educationList // ignore: cast_nullable_to_non_nullable
              as List<EducationModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationListImpl implements _EducationList {
  _$EducationListImpl({this.educationList});

  factory _$EducationListImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationListImplFromJson(json);

  @override
  List<EducationModel?>? educationList;

  @override
  String toString() {
    return 'EducationList(educationList: $educationList)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationListImplCopyWith<_$EducationListImpl> get copyWith =>
      __$$EducationListImplCopyWithImpl<_$EducationListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationListImplToJson(
      this,
    );
  }
}

abstract class _EducationList implements EducationList {
  factory _EducationList({List<EducationModel?>? educationList}) =
      _$EducationListImpl;

  factory _EducationList.fromJson(Map<String, dynamic> json) =
      _$EducationListImpl.fromJson;

  @override
  List<EducationModel?>? get educationList;
  set educationList(List<EducationModel?>? value);
  @override
  @JsonKey(ignore: true)
  _$$EducationListImplCopyWith<_$EducationListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
