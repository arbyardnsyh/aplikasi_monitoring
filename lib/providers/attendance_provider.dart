import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/attendance_record.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> _students = [
    Student(name: 'Arby'),
    Student(name: 'Ardiansyah'),
    Student(name: 'Kazee'),
    Student(name: 'Gharra'),
    Student(name: 'Ahmad'),
  ];

  List<AttendanceRecord> _history = [];

  List<Student> get students => _students;

  List<AttendanceRecord> get history =>
      _history.reversed.toList(); // Latest first

  void toggleAttendance(int index, bool? value) {
    if (value != null) {
      _students[index].isPresent = value;
      notifyListeners();
    }
  }

  void saveAttendance() {
    int present = _students.where((s) => s.isPresent).length;
    int absent = _students.length - present;

    AttendanceRecord record = AttendanceRecord(
      date: DateTime.now(),
      presentCount: present,
      absentCount: absent,
    );

    _history.add(record);

    // Reset attendance
    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
