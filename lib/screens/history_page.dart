
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
      builder: (context, attendanceProvider, child) {
        List history = attendanceProvider.history;

        return Scaffold(
          appBar: AppBar(
            title: Text('Riwayat Kehadiran'),
          ),
          body: history.isEmpty
              ? Center(child: Text('Belum ada riwayat kehadiran.'))
              : ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    var record = history[index];
                    return ListTile(
                      leading: Icon(Icons.history),
                      title: Text(record.formattedDate),
                      subtitle: Text(
                          'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}'),
                    );
                  },
                ),
        );
      },
    );
  }
}
