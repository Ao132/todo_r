import 'package:flutter/material.dart';
import 'package:todo_r/theme/app_theme.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppTheme.whiteColor),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 4,
            color: AppTheme.primaryLight,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
                ),
                Text(
                  'Desc',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
            decoration: BoxDecoration(color: AppTheme.primaryLight, borderRadius: BorderRadius.circular(25)),
            child: const Icon(
              Icons.check,
              color: AppTheme.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
