import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_management/screens/widgets/common_text.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: "Schedule Time",
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
