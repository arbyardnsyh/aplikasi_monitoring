import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';
import '../models/student.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
      builder: (context, attendanceProvider, child) {
        List<Student> students = attendanceProvider.students;

        return Scaffold(
          appBar: AppBar(
            title: Text('Pencatatan Kehadiran'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(students[index].name),
                      trailing: Checkbox(
                        value: students[index].isPresent,
                        onChanged: (value) {
                          attendanceProvider.toggleAttendance(index, value);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: students.isEmpty
                      ? null
                      : () {
                          attendanceProvider.saveAttendance();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Kehadiran disimpan!'),
                            ),
                          );
                        },
                  child: Text('Simpan Kehadiran'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Full width
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
