import 'package:intl/intl.dart';

class AttendanceRecord {
  final DateTime date;
  final int presentCount;
  final int absentCount;

  AttendanceRecord({
    required this.date,
    required this.presentCount,
    required this.absentCount,
  });

  String get formattedDate {
    return DateFormat('dd MMM yyyy').format(date);
  }
}
