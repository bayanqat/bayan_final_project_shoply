// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legal_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LegalContentModel {

 String? get title;@TimestampConverter() DateTime? get lastUpdated; List<LegalSectionModel>? get sections;
/// Create a copy of LegalContentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalContentModelCopyWith<LegalContentModel> get copyWith => _$LegalContentModelCopyWithImpl<LegalContentModel>(this as LegalContentModel, _$identity);

  /// Serializes this LegalContentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LegalContentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalContentModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.lastUpdated, _this.lastUpdated) || other.lastUpdated == _this.lastUpdated)&&const DeepCollectionEquality().equals(other.sections, _this.sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LegalContentModel;
  return Object.hash(runtimeType,_this.title,_this.lastUpdated,const DeepCollectionEquality().hash(_this.sections));
}

@override
String toString() {
  final _this = this as LegalContentModel;
  return 'LegalContentModel(title: ${_this.title}, lastUpdated: ${_this.lastUpdated}, sections: ${_this.sections})';
}


}

/// @nodoc
abstract mixin class $LegalContentModelCopyWith<$Res>  {
  factory $LegalContentModelCopyWith(LegalContentModel value, $Res Function(LegalContentModel) _then) = _$LegalContentModelCopyWithImpl;
@useResult
$Res call({
 String? title,@TimestampConverter() DateTime? lastUpdated, List<LegalSectionModel>? sections
});




}
/// @nodoc
class _$LegalContentModelCopyWithImpl<$Res>
    implements $LegalContentModelCopyWith<$Res> {
  _$LegalContentModelCopyWithImpl(this._self, this._then);

  final LegalContentModel _self;
  final $Res Function(LegalContentModel) _then;

/// Create a copy of LegalContentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? lastUpdated = freezed,Object? sections = freezed,}) {
  return _then(LegalContentModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,sections: freezed == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<LegalSectionModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LegalContentModel].
extension LegalContentModelPatterns on LegalContentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalContentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalContentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalContentModel value)  $default,){
final _that = this;
switch (_that) {
case _LegalContentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalContentModel value)?  $default,){
final _that = this;
switch (_that) {
case _LegalContentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title, @TimestampConverter()  DateTime? lastUpdated,  List<LegalSectionModel>? sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalContentModel() when $default != null:
return $default(_that.title,_that.lastUpdated,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title, @TimestampConverter()  DateTime? lastUpdated,  List<LegalSectionModel>? sections)  $default,) {final _that = this;
switch (_that) {
case _LegalContentModel():
return $default(_that.title,_that.lastUpdated,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title, @TimestampConverter()  DateTime? lastUpdated,  List<LegalSectionModel>? sections)?  $default,) {final _that = this;
switch (_that) {
case _LegalContentModel() when $default != null:
return $default(_that.title,_that.lastUpdated,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalContentModel extends LegalContentModel {
  const _LegalContentModel({this.title, @TimestampConverter() this.lastUpdated,  List<LegalSectionModel>? sections}): _sections = sections,super._();
  factory _LegalContentModel.fromJson(Map<String, dynamic> json) => _$LegalContentModelFromJson(json);

@override final  String? title;
@override@TimestampConverter() final  DateTime? lastUpdated;
 final  List<LegalSectionModel>? _sections;
@override List<LegalSectionModel>? get sections {
  final value = _sections;
  if (value == null) return null;
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LegalContentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalContentModelCopyWith<_LegalContentModel> get copyWith => __$LegalContentModelCopyWithImpl<_LegalContentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalContentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalContentModel&&(identical(other.title, title) || other.title == title)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,lastUpdated,const DeepCollectionEquality().hash(_sections));
}

@override
String toString() {
    return 'LegalContentModel(title: $title, lastUpdated: $lastUpdated, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$LegalContentModelCopyWith<$Res> implements $LegalContentModelCopyWith<$Res> {
  factory _$LegalContentModelCopyWith(_LegalContentModel value, $Res Function(_LegalContentModel) _then) = __$LegalContentModelCopyWithImpl;
@override @useResult
$Res call({
 String? title,@TimestampConverter() DateTime? lastUpdated, List<LegalSectionModel>? sections
});




}
/// @nodoc
class __$LegalContentModelCopyWithImpl<$Res>
    implements _$LegalContentModelCopyWith<$Res> {
  __$LegalContentModelCopyWithImpl(this._self, this._then);

  final _LegalContentModel _self;
  final $Res Function(_LegalContentModel) _then;

/// Create a copy of LegalContentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? lastUpdated = freezed,Object? sections = freezed,}) {
  return _then(_LegalContentModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,sections: freezed == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<LegalSectionModel>?,
  ));
}


}


/// @nodoc
mixin _$LegalSectionModel {

 String? get title; String? get body;
/// Create a copy of LegalSectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalSectionModelCopyWith<LegalSectionModel> get copyWith => _$LegalSectionModelCopyWithImpl<LegalSectionModel>(this as LegalSectionModel, _$identity);

  /// Serializes this LegalSectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LegalSectionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalSectionModel&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LegalSectionModel;
  return Object.hash(runtimeType,_this.title,_this.body);
}

@override
String toString() {
  final _this = this as LegalSectionModel;
  return 'LegalSectionModel(title: ${_this.title}, body: ${_this.body})';
}


}

/// @nodoc
abstract mixin class $LegalSectionModelCopyWith<$Res>  {
  factory $LegalSectionModelCopyWith(LegalSectionModel value, $Res Function(LegalSectionModel) _then) = _$LegalSectionModelCopyWithImpl;
@useResult
$Res call({
 String? title, String? body
});




}
/// @nodoc
class _$LegalSectionModelCopyWithImpl<$Res>
    implements $LegalSectionModelCopyWith<$Res> {
  _$LegalSectionModelCopyWithImpl(this._self, this._then);

  final LegalSectionModel _self;
  final $Res Function(LegalSectionModel) _then;

/// Create a copy of LegalSectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? body = freezed,}) {
  return _then(LegalSectionModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LegalSectionModel].
extension LegalSectionModelPatterns on LegalSectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalSectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalSectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalSectionModel value)  $default,){
final _that = this;
switch (_that) {
case _LegalSectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalSectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _LegalSectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalSectionModel() when $default != null:
return $default(_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? body)  $default,) {final _that = this;
switch (_that) {
case _LegalSectionModel():
return $default(_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? body)?  $default,) {final _that = this;
switch (_that) {
case _LegalSectionModel() when $default != null:
return $default(_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalSectionModel extends LegalSectionModel {
  const _LegalSectionModel({this.title, this.body}): super._();
  factory _LegalSectionModel.fromJson(Map<String, dynamic> json) => _$LegalSectionModelFromJson(json);

@override final  String? title;
@override final  String? body;

/// Create a copy of LegalSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalSectionModelCopyWith<_LegalSectionModel> get copyWith => __$LegalSectionModelCopyWithImpl<_LegalSectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalSectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalSectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,body);
}

@override
String toString() {
    return 'LegalSectionModel(title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$LegalSectionModelCopyWith<$Res> implements $LegalSectionModelCopyWith<$Res> {
  factory _$LegalSectionModelCopyWith(_LegalSectionModel value, $Res Function(_LegalSectionModel) _then) = __$LegalSectionModelCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? body
});




}
/// @nodoc
class __$LegalSectionModelCopyWithImpl<$Res>
    implements _$LegalSectionModelCopyWith<$Res> {
  __$LegalSectionModelCopyWithImpl(this._self, this._then);

  final _LegalSectionModel _self;
  final $Res Function(_LegalSectionModel) _then;

/// Create a copy of LegalSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? body = freezed,}) {
  return _then(_LegalSectionModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
