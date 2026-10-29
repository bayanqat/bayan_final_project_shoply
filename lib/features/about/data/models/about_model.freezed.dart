// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AboutModel {

 String? get appName; String? get version; String? get tagline; String? get footer;
/// Create a copy of AboutModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AboutModelCopyWith<AboutModel> get copyWith => _$AboutModelCopyWithImpl<AboutModel>(this as AboutModel, _$identity);

  /// Serializes this AboutModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AboutModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutModel&&(identical(other.appName, _this.appName) || other.appName == _this.appName)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.tagline, _this.tagline) || other.tagline == _this.tagline)&&(identical(other.footer, _this.footer) || other.footer == _this.footer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AboutModel;
  return Object.hash(runtimeType,_this.appName,_this.version,_this.tagline,_this.footer);
}

@override
String toString() {
  final _this = this as AboutModel;
  return 'AboutModel(appName: ${_this.appName}, version: ${_this.version}, tagline: ${_this.tagline}, footer: ${_this.footer})';
}


}

/// @nodoc
abstract mixin class $AboutModelCopyWith<$Res>  {
  factory $AboutModelCopyWith(AboutModel value, $Res Function(AboutModel) _then) = _$AboutModelCopyWithImpl;
@useResult
$Res call({
 String? appName, String? version, String? tagline, String? footer
});




}
/// @nodoc
class _$AboutModelCopyWithImpl<$Res>
    implements $AboutModelCopyWith<$Res> {
  _$AboutModelCopyWithImpl(this._self, this._then);

  final AboutModel _self;
  final $Res Function(AboutModel) _then;

/// Create a copy of AboutModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appName = freezed,Object? version = freezed,Object? tagline = freezed,Object? footer = freezed,}) {
  return _then(AboutModel(
appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AboutModel].
extension AboutModelPatterns on AboutModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AboutModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AboutModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AboutModel value)  $default,){
final _that = this;
switch (_that) {
case _AboutModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AboutModel value)?  $default,){
final _that = this;
switch (_that) {
case _AboutModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? appName,  String? version,  String? tagline,  String? footer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AboutModel() when $default != null:
return $default(_that.appName,_that.version,_that.tagline,_that.footer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? appName,  String? version,  String? tagline,  String? footer)  $default,) {final _that = this;
switch (_that) {
case _AboutModel():
return $default(_that.appName,_that.version,_that.tagline,_that.footer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? appName,  String? version,  String? tagline,  String? footer)?  $default,) {final _that = this;
switch (_that) {
case _AboutModel() when $default != null:
return $default(_that.appName,_that.version,_that.tagline,_that.footer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AboutModel extends AboutModel {
  const _AboutModel({this.appName, this.version, this.tagline, this.footer}): super._();
  factory _AboutModel.fromJson(Map<String, dynamic> json) => _$AboutModelFromJson(json);

@override final  String? appName;
@override final  String? version;
@override final  String? tagline;
@override final  String? footer;

/// Create a copy of AboutModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutModelCopyWith<_AboutModel> get copyWith => __$AboutModelCopyWithImpl<_AboutModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AboutModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutModel&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.version, version) || other.version == version)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.footer, footer) || other.footer == footer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,appName,version,tagline,footer);
}

@override
String toString() {
    return 'AboutModel(appName: $appName, version: $version, tagline: $tagline, footer: $footer)';
}


}

/// @nodoc
abstract mixin class _$AboutModelCopyWith<$Res> implements $AboutModelCopyWith<$Res> {
  factory _$AboutModelCopyWith(_AboutModel value, $Res Function(_AboutModel) _then) = __$AboutModelCopyWithImpl;
@override @useResult
$Res call({
 String? appName, String? version, String? tagline, String? footer
});




}
/// @nodoc
class __$AboutModelCopyWithImpl<$Res>
    implements _$AboutModelCopyWith<$Res> {
  __$AboutModelCopyWithImpl(this._self, this._then);

  final _AboutModel _self;
  final $Res Function(_AboutModel) _then;

/// Create a copy of AboutModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appName = freezed,Object? version = freezed,Object? tagline = freezed,Object? footer = freezed,}) {
  return _then(_AboutModel(
appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,tagline: freezed == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String?,footer: freezed == footer ? _self.footer : footer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
