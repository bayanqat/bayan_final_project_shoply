// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactInfoModel _$ContactInfoModelFromJson(Map<String, dynamic> json) => _ContactInfoModel(
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  supportEmail: json['supportEmail'] as String?,
  subjects: (json['subjects'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ContactInfoModelToJson(_ContactInfoModel instance) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'supportEmail': instance.supportEmail,
  'subjects': instance.subjects,
};
