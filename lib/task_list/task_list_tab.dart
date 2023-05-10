import 'dart:developer';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_r/task_list/task_widget.dart';
import 'package:todo_r/theme/app_theme.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do List')),
      body: Column(children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => log('$date'),
          leftMargin: 20,
          monthColor: AppTheme.blackColor,
          dayColor: AppTheme.blackColor,
          activeDayColor: AppTheme.whiteColor,
          activeBackgroundDayColor: AppTheme.primaryLight,
          dotsColor: AppTheme.whiteColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => const TaskWidget(),
          itemCount: 10,
        ))
      ]),
    );
  }
}
