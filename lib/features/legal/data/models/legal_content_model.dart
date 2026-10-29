import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/converters/timestamp_converter.dart';
import '../../domain/entities/legal_content_entity.dart';

part 'legal_content_model.freezed.dart';
part 'legal_content_model.g.dart';

@freezed
abstract class LegalContentModel with _$LegalContentModel {
  const LegalContentModel._();

  const factory LegalContentModel({
    String? title,
    @TimestampConverter() DateTime? lastUpdated,
    List<LegalSectionModel>? sections,
  }) = _LegalContentModel;

  factory LegalContentModel.fromJson(Map<String, dynamic> json) =>
      _$LegalContentModelFromJson(json);

  LegalContentEntity toEntity() {
    return LegalContentEntity(
      title: title,
      lastUpdated: lastUpdated,
      sections: sections?.map((section) => section.toEntity()).toList() ?? [],
    );
  }
}

@freezed
abstract class LegalSectionModel with _$LegalSectionModel {
  const LegalSectionModel._();

  const factory LegalSectionModel({String? title, String? body}) = _LegalSectionModel;

  factory LegalSectionModel.fromJson(Map<String, dynamic> json) =>
      _$LegalSectionModelFromJson(json);

  LegalSectionEntity toEntity() {
    return LegalSectionEntity(title: title, body: body);
  }
}
