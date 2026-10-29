// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactInfoModel {

 String? get title; String? get subtitle; String? get supportEmail; List<String>? get subjects;
/// Create a copy of ContactInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactInfoModelCopyWith<ContactInfoModel> get copyWith => _$ContactInfoModelCopyWithImpl<ContactInfoModel>(this as ContactInfoModel, _$identity);

  /// Serializes this ContactInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ContactInfoModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactInfoModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.supportEmail, _this.supportEmail) || other.supportEmail == _this.supportEmail)&&const DeepCollectionEquality().equals(other.subjects, _this.subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ContactInfoModel;
  return Object.hash(runtimeType,_this.title,_this.subtitle,_this.supportEmail,const DeepCollectionEquality().hash(_this.subjects));
}

@override
String toString() {
  final _this = this as ContactInfoModel;
  return 'ContactInfoModel(title: ${_this.title}, subtitle: ${_this.subtitle}, supportEmail: ${_this.supportEmail}, subjects: ${_this.subjects})';
}


}

/// @nodoc
abstract mixin class $ContactInfoModelCopyWith<$Res>  {
  factory $ContactInfoModelCopyWith(ContactInfoModel value, $Res Function(ContactInfoModel) _then) = _$ContactInfoModelCopyWithImpl;
@useResult
$Res call({
 String? title, String? subtitle, String? supportEmail, List<String>? subjects
});




}
/// @nodoc
class _$ContactInfoModelCopyWithImpl<$Res>
    implements $ContactInfoModelCopyWith<$Res> {
  _$ContactInfoModelCopyWithImpl(this._self, this._then);

  final ContactInfoModel _self;
  final $Res Function(ContactInfoModel) _then;

/// Create a copy of ContactInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? subtitle = freezed,Object? supportEmail = freezed,Object? subjects = freezed,}) {
  return _then(ContactInfoModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,supportEmail: freezed == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String?,subjects: freezed == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactInfoModel].
extension ContactInfoModelPatterns on ContactInfoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactInfoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactInfoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactInfoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? subtitle,  String? supportEmail,  List<String>? subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactInfoModel() when $default != null:
return $default(_that.title,_that.subtitle,_that.supportEmail,_that.subjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? subtitle,  String? supportEmail,  List<String>? subjects)  $default,) {final _that = this;
switch (_that) {
case _ContactInfoModel():
return $default(_that.title,_that.subtitle,_that.supportEmail,_that.subjects);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? subtitle,  String? supportEmail,  List<String>? subjects)?  $default,) {final _that = this;
switch (_that) {
case _ContactInfoModel() when $default != null:
return $default(_that.title,_that.subtitle,_that.supportEmail,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactInfoModel extends ContactInfoModel {
  const _ContactInfoModel({this.title, this.subtitle, this.supportEmail,  List<String>? subjects}): _subjects = subjects,super._();
  factory _ContactInfoModel.fromJson(Map<String, dynamic> json) => _$ContactInfoModelFromJson(json);

@override final  String? title;
@override final  String? subtitle;
@override final  String? supportEmail;
 final  List<String>? _subjects;
@override List<String>? get subjects {
  final value = _subjects;
  if (value == null) return null;
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ContactInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactInfoModelCopyWith<_ContactInfoModel> get copyWith => __$ContactInfoModelCopyWithImpl<_ContactInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactInfoModel&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.supportEmail, supportEmail) || other.supportEmail == supportEmail)&&const DeepCollectionEquality().equals(other.subjects, _subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,subtitle,supportEmail,const DeepCollectionEquality().hash(_subjects));
}

@override
String toString() {
    return 'ContactInfoModel(title: $title, subtitle: $subtitle, supportEmail: $supportEmail, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$ContactInfoModelCopyWith<$Res> implements $ContactInfoModelCopyWith<$Res> {
  factory _$ContactInfoModelCopyWith(_ContactInfoModel value, $Res Function(_ContactInfoModel) _then) = __$ContactInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? subtitle, String? supportEmail, List<String>? subjects
});




}
/// @nodoc
class __$ContactInfoModelCopyWithImpl<$Res>
    implements _$ContactInfoModelCopyWith<$Res> {
  __$ContactInfoModelCopyWithImpl(this._self, this._then);

  final _ContactInfoModel _self;
  final $Res Function(_ContactInfoModel) _then;

/// Create a copy of ContactInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? subtitle = freezed,Object? supportEmail = freezed,Object? subjects = freezed,}) {
  return _then(_ContactInfoModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,supportEmail: freezed == supportEmail ? _self.supportEmail : supportEmail // ignore: cast_nullable_to_non_nullable
as String?,subjects: freezed == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
