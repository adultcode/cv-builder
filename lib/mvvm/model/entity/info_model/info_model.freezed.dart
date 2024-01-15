// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) {
  return _InfoModel.fromJson(json);
}

/// @nodoc
mixin _$InfoModel {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  set email(String? value) => throw _privateConstructorUsedError;
  int? get mobile => throw _privateConstructorUsedError;
  set mobile(int? value) => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  set job(String? value) => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  set bio(String? value) => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  set city(String? value) => throw _privateConstructorUsedError;
  String? get birth => throw _privateConstructorUsedError;
  set birth(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoModelCopyWith<InfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoModelCopyWith<$Res> {
  factory $InfoModelCopyWith(InfoModel value, $Res Function(InfoModel) then) =
      _$InfoModelCopyWithImpl<$Res, InfoModel>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      int? mobile,
      String? job,
      String? bio,
      String? city,
      String? birth});
}

/// @nodoc
class _$InfoModelCopyWithImpl<$Res, $Val extends InfoModel>
    implements $InfoModelCopyWith<$Res> {
  _$InfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? job = freezed,
    Object? bio = freezed,
    Object? city = freezed,
    Object? birth = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoModelImplCopyWith<$Res>
    implements $InfoModelCopyWith<$Res> {
  factory _$$InfoModelImplCopyWith(
          _$InfoModelImpl value, $Res Function(_$InfoModelImpl) then) =
      __$$InfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      int? mobile,
      String? job,
      String? bio,
      String? city,
      String? birth});
}

/// @nodoc
class __$$InfoModelImplCopyWithImpl<$Res>
    extends _$InfoModelCopyWithImpl<$Res, _$InfoModelImpl>
    implements _$$InfoModelImplCopyWith<$Res> {
  __$$InfoModelImplCopyWithImpl(
      _$InfoModelImpl _value, $Res Function(_$InfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? mobile = freezed,
    Object? job = freezed,
    Object? bio = freezed,
    Object? city = freezed,
    Object? birth = freezed,
  }) {
    return _then(_$InfoModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as int?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      birth: freezed == birth
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoModelImpl with DiagnosticableTreeMixin implements _InfoModel {
  _$InfoModelImpl(
      {this.name,
      this.email,
      this.mobile,
      this.job,
      this.bio,
      this.city,
      this.birth});

  factory _$InfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoModelImplFromJson(json);

  @override
  String? name;
  @override
  String? email;
  @override
  int? mobile;
  @override
  String? job;
  @override
  String? bio;
  @override
  String? city;
  @override
  String? birth;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InfoModel(name: $name, email: $email, mobile: $mobile, job: $job, bio: $bio, city: $city, birth: $birth)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InfoModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('job', job))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('birth', birth));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoModelImplCopyWith<_$InfoModelImpl> get copyWith =>
      __$$InfoModelImplCopyWithImpl<_$InfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoModelImplToJson(
      this,
    );
  }
}

abstract class _InfoModel implements InfoModel {
  factory _InfoModel(
      {String? name,
      String? email,
      int? mobile,
      String? job,
      String? bio,
      String? city,
      String? birth}) = _$InfoModelImpl;

  factory _InfoModel.fromJson(Map<String, dynamic> json) =
      _$InfoModelImpl.fromJson;

  @override
  String? get name;
  set name(String? value);
  @override
  String? get email;
  set email(String? value);
  @override
  int? get mobile;
  set mobile(int? value);
  @override
  String? get job;
  set job(String? value);
  @override
  String? get bio;
  set bio(String? value);
  @override
  String? get city;
  set city(String? value);
  @override
  String? get birth;
  set birth(String? value);
  @override
  @JsonKey(ignore: true)
  _$$InfoModelImplCopyWith<_$InfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
