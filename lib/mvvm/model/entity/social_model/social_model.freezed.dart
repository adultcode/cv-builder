// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialModel _$SocialModelFromJson(Map<String, dynamic> json) {
  return _SocialModel.fromJson(json);
}

/// @nodoc
mixin _$SocialModel {
  String? get address => throw _privateConstructorUsedError;
  set address(String? value) => throw _privateConstructorUsedError;
  String? get icon_path => throw _privateConstructorUsedError;
  set icon_path(String? value) => throw _privateConstructorUsedError;
  SocialType? get socialType => throw _privateConstructorUsedError;
  set socialType(SocialType? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialModelCopyWith<SocialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialModelCopyWith<$Res> {
  factory $SocialModelCopyWith(
          SocialModel value, $Res Function(SocialModel) then) =
      _$SocialModelCopyWithImpl<$Res, SocialModel>;
  @useResult
  $Res call({String? address, String? icon_path, SocialType? socialType});
}

/// @nodoc
class _$SocialModelCopyWithImpl<$Res, $Val extends SocialModel>
    implements $SocialModelCopyWith<$Res> {
  _$SocialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? icon_path = freezed,
    Object? socialType = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      icon_path: freezed == icon_path
          ? _value.icon_path
          : icon_path // ignore: cast_nullable_to_non_nullable
              as String?,
      socialType: freezed == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as SocialType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialModelImplCopyWith<$Res>
    implements $SocialModelCopyWith<$Res> {
  factory _$$SocialModelImplCopyWith(
          _$SocialModelImpl value, $Res Function(_$SocialModelImpl) then) =
      __$$SocialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? address, String? icon_path, SocialType? socialType});
}

/// @nodoc
class __$$SocialModelImplCopyWithImpl<$Res>
    extends _$SocialModelCopyWithImpl<$Res, _$SocialModelImpl>
    implements _$$SocialModelImplCopyWith<$Res> {
  __$$SocialModelImplCopyWithImpl(
      _$SocialModelImpl _value, $Res Function(_$SocialModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? icon_path = freezed,
    Object? socialType = freezed,
  }) {
    return _then(_$SocialModelImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      icon_path: freezed == icon_path
          ? _value.icon_path
          : icon_path // ignore: cast_nullable_to_non_nullable
              as String?,
      socialType: freezed == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as SocialType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialModelImpl with DiagnosticableTreeMixin implements _SocialModel {
  _$SocialModelImpl({this.address, this.icon_path, this.socialType});

  factory _$SocialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialModelImplFromJson(json);

  @override
  String? address;
  @override
  String? icon_path;
  @override
  SocialType? socialType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialModel(address: $address, icon_path: $icon_path, socialType: $socialType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SocialModel'))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('icon_path', icon_path))
      ..add(DiagnosticsProperty('socialType', socialType));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialModelImplCopyWith<_$SocialModelImpl> get copyWith =>
      __$$SocialModelImplCopyWithImpl<_$SocialModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialModelImplToJson(
      this,
    );
  }
}

abstract class _SocialModel implements SocialModel {
  factory _SocialModel(
      {String? address,
      String? icon_path,
      SocialType? socialType}) = _$SocialModelImpl;

  factory _SocialModel.fromJson(Map<String, dynamic> json) =
      _$SocialModelImpl.fromJson;

  @override
  String? get address;
  set address(String? value);
  @override
  String? get icon_path;
  set icon_path(String? value);
  @override
  SocialType? get socialType;
  set socialType(SocialType? value);
  @override
  @JsonKey(ignore: true)
  _$$SocialModelImplCopyWith<_$SocialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
