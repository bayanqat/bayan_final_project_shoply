import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/converters/timestamp_converter.dart';
import '../../domain/entities/notification_entity.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    String? id,
    String? title,
    String? body,
    String? type,
    bool? isRead,
    @TimestampConverter() DateTime? createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      title: title,
      body: body,
      type: type,
      isRead: isRead ?? false,
      createdAt: createdAt,
    );
  }
}
