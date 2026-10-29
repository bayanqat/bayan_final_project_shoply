import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/contact_info_entity.dart';

part 'contact_info_model.freezed.dart';
part 'contact_info_model.g.dart';

@freezed
abstract class ContactInfoModel with _$ContactInfoModel {
  const ContactInfoModel._();

  const factory ContactInfoModel({
    String? title,
    String? subtitle,
    String? supportEmail,
    List<String>? subjects,
  }) = _ContactInfoModel;

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) => _$ContactInfoModelFromJson(json);

  ContactInfoEntity toEntity() {
    return ContactInfoEntity(
      title: title,
      subtitle: subtitle,
      supportEmail: supportEmail,
      subjects: subjects ?? [],
    );
  }
}
