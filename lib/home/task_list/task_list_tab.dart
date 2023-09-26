import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_r/app_theme.dart';
import 'package:todo_r/home/task_list/task_widget.dart';
import 'package:todo_r/providers/list_provider.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of(context);
    if (listProvider.tasksList.isEmpty) {
      listProvider.getAllTasksFromFireStore();
    }
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => {},
          leftMargin: 20,
          monthColor: AppTheme.blackColor,
          dayColor: AppTheme.blackColor,
          activeDayColor: AppTheme.whiteColor,
          activeBackgroundDayColor: AppTheme.primarylightColor,
          dotsColor: AppTheme.whiteColor,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskWidget(
              task: listProvider.tasksList[index],
            ),
            itemCount: listProvider.tasksList.length,
          ),
        )
      ],
    );
  }
}
