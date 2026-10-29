// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LegalContentModel _$LegalContentModelFromJson(Map<String, dynamic> json) =>
    _LegalContentModel(
      title: json['title'] as String?,
      lastUpdated: const TimestampConverter().fromJson(json['lastUpdated']),
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => LegalSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LegalContentModelToJson(_LegalContentModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'lastUpdated': const TimestampConverter().toJson(instance.lastUpdated),
      'sections': instance.sections,
    };

_LegalSectionModel _$LegalSectionModelFromJson(Map<String, dynamic> json) =>
    _LegalSectionModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$LegalSectionModelToJson(_LegalSectionModel instance) =>
    <String, dynamic>{'title': instance.title, 'body': instance.body};
