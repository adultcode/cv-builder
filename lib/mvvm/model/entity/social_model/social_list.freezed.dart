// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialList _$SocialListFromJson(Map<String, dynamic> json) {
  return _SocialList.fromJson(json);
}

/// @nodoc
mixin _$SocialList {
  List<SocialModel?>? get socialModels => throw _privateConstructorUsedError;
  set socialModels(List<SocialModel?>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialListCopyWith<SocialList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialListCopyWith<$Res> {
  factory $SocialListCopyWith(
          SocialList value, $Res Function(SocialList) then) =
      _$SocialListCopyWithImpl<$Res, SocialList>;
  @useResult
  $Res call({List<SocialModel?>? socialModels});
}

/// @nodoc
class _$SocialListCopyWithImpl<$Res, $Val extends SocialList>
    implements $SocialListCopyWith<$Res> {
  _$SocialListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialModels = freezed,
  }) {
    return _then(_value.copyWith(
      socialModels: freezed == socialModels
          ? _value.socialModels
          : socialModels // ignore: cast_nullable_to_non_nullable
              as List<SocialModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialListImplCopyWith<$Res>
    implements $SocialListCopyWith<$Res> {
  factory _$$SocialListImplCopyWith(
          _$SocialListImpl value, $Res Function(_$SocialListImpl) then) =
      __$$SocialListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SocialModel?>? socialModels});
}

/// @nodoc
class __$$SocialListImplCopyWithImpl<$Res>
    extends _$SocialListCopyWithImpl<$Res, _$SocialListImpl>
    implements _$$SocialListImplCopyWith<$Res> {
  __$$SocialListImplCopyWithImpl(
      _$SocialListImpl _value, $Res Function(_$SocialListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socialModels = freezed,
  }) {
    return _then(_$SocialListImpl(
      socialModels: freezed == socialModels
          ? _value.socialModels
          : socialModels // ignore: cast_nullable_to_non_nullable
              as List<SocialModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialListImpl with DiagnosticableTreeMixin implements _SocialList {
  _$SocialListImpl({this.socialModels});

  factory _$SocialListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialListImplFromJson(json);

  @override
  List<SocialModel?>? socialModels;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SocialList(socialModels: $socialModels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SocialList'))
      ..add(DiagnosticsProperty('socialModels', socialModels));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialListImplCopyWith<_$SocialListImpl> get copyWith =>
      __$$SocialListImplCopyWithImpl<_$SocialListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialListImplToJson(
      this,
    );
  }
}

abstract class _SocialList implements SocialList {
  factory _SocialList({List<SocialModel?>? socialModels}) = _$SocialListImpl;

  factory _SocialList.fromJson(Map<String, dynamic> json) =
      _$SocialListImpl.fromJson;

  @override
  List<SocialModel?>? get socialModels;
  set socialModels(List<SocialModel?>? value);
  @override
  @JsonKey(ignore: true)
  _$$SocialListImplCopyWith<_$SocialListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
