import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Converts Firestore Timestamp fields to DateTime in models
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) => json is Timestamp ? json.toDate() : null;

  @override
  Object? toJson(DateTime? date) => date == null ? null : Timestamp.fromDate(date);
}
