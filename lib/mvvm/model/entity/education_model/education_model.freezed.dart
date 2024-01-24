// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EducationModel _$EducationModelFromJson(Map<String, dynamic> json) {
  return _EducationModel.fromJson(json);
}

/// @nodoc
mixin _$EducationModel {
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get start_date => throw _privateConstructorUsedError;
  set start_date(String? value) => throw _privateConstructorUsedError;
  String? get end_date => throw _privateConstructorUsedError;
  set end_date(String? value) => throw _privateConstructorUsedError;
  String? get university => throw _privateConstructorUsedError;
  set university(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationModelCopyWith<EducationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationModelCopyWith<$Res> {
  factory $EducationModelCopyWith(
          EducationModel value, $Res Function(EducationModel) then) =
      _$EducationModelCopyWithImpl<$Res, EducationModel>;
  @useResult
  $Res call(
      {String? title,
      String? start_date,
      String? end_date,
      String? university,
      String? description,
      int? id});
}

/// @nodoc
class _$EducationModelCopyWithImpl<$Res, $Val extends EducationModel>
    implements $EducationModelCopyWith<$Res> {
  _$EducationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? university = freezed,
    Object? description = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      start_date: freezed == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      end_date: freezed == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      university: freezed == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationModelImplCopyWith<$Res>
    implements $EducationModelCopyWith<$Res> {
  factory _$$EducationModelImplCopyWith(_$EducationModelImpl value,
          $Res Function(_$EducationModelImpl) then) =
      __$$EducationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? start_date,
      String? end_date,
      String? university,
      String? description,
      int? id});
}

/// @nodoc
class __$$EducationModelImplCopyWithImpl<$Res>
    extends _$EducationModelCopyWithImpl<$Res, _$EducationModelImpl>
    implements _$$EducationModelImplCopyWith<$Res> {
  __$$EducationModelImplCopyWithImpl(
      _$EducationModelImpl _value, $Res Function(_$EducationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? university = freezed,
    Object? description = freezed,
    Object? id = freezed,
  }) {
    return _then(_$EducationModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      start_date: freezed == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      end_date: freezed == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      university: freezed == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationModelImpl implements _EducationModel {
  _$EducationModelImpl(
      {this.title,
      this.start_date,
      this.end_date,
      this.university,
      this.description,
      this.id});

  factory _$EducationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationModelImplFromJson(json);

  @override
  String? title;
  @override
  String? start_date;
  @override
  String? end_date;
  @override
  String? university;
  @override
  String? description;
  @override
  int? id;

  @override
  String toString() {
    return 'EducationModel(title: $title, start_date: $start_date, end_date: $end_date, university: $university, description: $description, id: $id)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationModelImplCopyWith<_$EducationModelImpl> get copyWith =>
      __$$EducationModelImplCopyWithImpl<_$EducationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationModelImplToJson(
      this,
    );
  }
}

abstract class _EducationModel implements EducationModel {
  factory _EducationModel(
      {String? title,
      String? start_date,
      String? end_date,
      String? university,
      String? description,
      int? id}) = _$EducationModelImpl;

  factory _EducationModel.fromJson(Map<String, dynamic> json) =
      _$EducationModelImpl.fromJson;

  @override
  String? get title;
  set title(String? value);
  @override
  String? get start_date;
  set start_date(String? value);
  @override
  String? get end_date;
  set end_date(String? value);
  @override
  String? get university;
  set university(String? value);
  @override
  String? get description;
  set description(String? value);
  @override
  int? get id;
  set id(int? value);
  @override
  @JsonKey(ignore: true)
  _$$EducationModelImplCopyWith<_$EducationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
