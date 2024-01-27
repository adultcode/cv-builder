// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageList _$LanguageListFromJson(Map<String, dynamic> json) {
  return _LanguageList.fromJson(json);
}

/// @nodoc
mixin _$LanguageList {
  List<LanguageModel?>? get lang_list => throw _privateConstructorUsedError;
  set lang_list(List<LanguageModel?>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageListCopyWith<LanguageList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageListCopyWith<$Res> {
  factory $LanguageListCopyWith(
          LanguageList value, $Res Function(LanguageList) then) =
      _$LanguageListCopyWithImpl<$Res, LanguageList>;
  @useResult
  $Res call({List<LanguageModel?>? lang_list});
}

/// @nodoc
class _$LanguageListCopyWithImpl<$Res, $Val extends LanguageList>
    implements $LanguageListCopyWith<$Res> {
  _$LanguageListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang_list = freezed,
  }) {
    return _then(_value.copyWith(
      lang_list: freezed == lang_list
          ? _value.lang_list
          : lang_list // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LanguageListImplCopyWith<$Res>
    implements $LanguageListCopyWith<$Res> {
  factory _$$LanguageListImplCopyWith(
          _$LanguageListImpl value, $Res Function(_$LanguageListImpl) then) =
      __$$LanguageListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LanguageModel?>? lang_list});
}

/// @nodoc
class __$$LanguageListImplCopyWithImpl<$Res>
    extends _$LanguageListCopyWithImpl<$Res, _$LanguageListImpl>
    implements _$$LanguageListImplCopyWith<$Res> {
  __$$LanguageListImplCopyWithImpl(
      _$LanguageListImpl _value, $Res Function(_$LanguageListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang_list = freezed,
  }) {
    return _then(_$LanguageListImpl(
      lang_list: freezed == lang_list
          ? _value.lang_list
          : lang_list // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageListImpl with DiagnosticableTreeMixin implements _LanguageList {
  _$LanguageListImpl({this.lang_list});

  factory _$LanguageListImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageListImplFromJson(json);

  @override
  List<LanguageModel?>? lang_list;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LanguageList(lang_list: $lang_list)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LanguageList'))
      ..add(DiagnosticsProperty('lang_list', lang_list));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageListImplCopyWith<_$LanguageListImpl> get copyWith =>
      __$$LanguageListImplCopyWithImpl<_$LanguageListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageListImplToJson(
      this,
    );
  }
}

abstract class _LanguageList implements LanguageList {
  factory _LanguageList({List<LanguageModel?>? lang_list}) = _$LanguageListImpl;

  factory _LanguageList.fromJson(Map<String, dynamic> json) =
      _$LanguageListImpl.fromJson;

  @override
  List<LanguageModel?>? get lang_list;
  set lang_list(List<LanguageModel?>? value);
  @override
  @JsonKey(ignore: true)
  _$$LanguageListImplCopyWith<_$LanguageListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
