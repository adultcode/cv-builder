// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkModel _$WorkModelFromJson(Map<String, dynamic> json) {
  return _WorkModel.fromJson(json);
}

/// @nodoc
mixin _$WorkModel {
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get start_date => throw _privateConstructorUsedError;
  set start_date(String? value) => throw _privateConstructorUsedError;
  String? get end_date => throw _privateConstructorUsedError;
  set end_date(String? value) => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  set company(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkModelCopyWith<WorkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkModelCopyWith<$Res> {
  factory $WorkModelCopyWith(WorkModel value, $Res Function(WorkModel) then) =
      _$WorkModelCopyWithImpl<$Res, WorkModel>;
  @useResult
  $Res call(
      {String? title,
      String? start_date,
      String? end_date,
      String? company,
      String? description});
}

/// @nodoc
class _$WorkModelCopyWithImpl<$Res, $Val extends WorkModel>
    implements $WorkModelCopyWith<$Res> {
  _$WorkModelCopyWithImpl(this._value, this._then);

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
    Object? company = freezed,
    Object? description = freezed,
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
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkModelImplCopyWith<$Res>
    implements $WorkModelCopyWith<$Res> {
  factory _$$WorkModelImplCopyWith(
          _$WorkModelImpl value, $Res Function(_$WorkModelImpl) then) =
      __$$WorkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? start_date,
      String? end_date,
      String? company,
      String? description});
}

/// @nodoc
class __$$WorkModelImplCopyWithImpl<$Res>
    extends _$WorkModelCopyWithImpl<$Res, _$WorkModelImpl>
    implements _$$WorkModelImplCopyWith<$Res> {
  __$$WorkModelImplCopyWithImpl(
      _$WorkModelImpl _value, $Res Function(_$WorkModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? company = freezed,
    Object? description = freezed,
  }) {
    return _then(_$WorkModelImpl(
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
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkModelImpl implements _WorkModel {
  _$WorkModelImpl(
      {this.title,
      this.start_date,
      this.end_date,
      this.company,
      this.description});

  factory _$WorkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkModelImplFromJson(json);

  @override
  String? title;
  @override
  String? start_date;
  @override
  String? end_date;
  @override
  String? company;
  @override
  String? description;

  @override
  String toString() {
    return 'WorkModel(title: $title, start_date: $start_date, end_date: $end_date, company: $company, description: $description)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkModelImplCopyWith<_$WorkModelImpl> get copyWith =>
      __$$WorkModelImplCopyWithImpl<_$WorkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkModelImplToJson(
      this,
    );
  }
}

abstract class _WorkModel implements WorkModel {
  factory _WorkModel(
      {String? title,
      String? start_date,
      String? end_date,
      String? company,
      String? description}) = _$WorkModelImpl;

  factory _WorkModel.fromJson(Map<String, dynamic> json) =
      _$WorkModelImpl.fromJson;

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
  String? get company;
  set company(String? value);
  @override
  String? get description;
  set description(String? value);
  @override
  @JsonKey(ignore: true)
  _$$WorkModelImplCopyWith<_$WorkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
