import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/about_entity.dart';

part 'about_model.freezed.dart';
part 'about_model.g.dart';

@freezed
abstract class AboutModel with _$AboutModel {
  const AboutModel._();

  const factory AboutModel({String? appName, String? version, String? tagline, String? footer}) =
      _AboutModel;

  factory AboutModel.fromJson(Map<String, dynamic> json) => _$AboutModelFromJson(json);

  AboutEntity toEntity() {
    return AboutEntity(appName: appName, version: version, tagline: tagline, footer: footer);
  }
}
