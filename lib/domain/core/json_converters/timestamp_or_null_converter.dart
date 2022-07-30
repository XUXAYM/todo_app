import 'package:json_annotation/json_annotation.dart';

class TimestampOrNullConverter implements JsonConverter<DateTime?, int?> {
  const TimestampOrNullConverter();

  @override
  DateTime? fromJson(int? timestamp) {
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  @override
  int? toJson(DateTime? date) => date?.toUtc().millisecondsSinceEpoch;
}
