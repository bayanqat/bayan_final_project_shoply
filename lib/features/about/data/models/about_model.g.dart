// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AboutModel _$AboutModelFromJson(Map<String, dynamic> json) => _AboutModel(
  appName: json['appName'] as String?,
  version: json['version'] as String?,
  tagline: json['tagline'] as String?,
  footer: json['footer'] as String?,
);

Map<String, dynamic> _$AboutModelToJson(_AboutModel instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'version': instance.version,
      'tagline': instance.tagline,
      'footer': instance.footer,
    };
