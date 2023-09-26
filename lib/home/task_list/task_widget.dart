// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_r/app_theme.dart';
import 'package:todo_r/model/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: AppTheme.redColor,
                foregroundColor: AppTheme.whiteColor,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: height * .02, horizontal: width * .05),
            padding: EdgeInsets.symmetric(
                vertical: height * .03, horizontal: width * .03),
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IntrinsicHeight(
                child: Row(
              children: [
                VerticalDivider(
                    color: AppTheme.primarylightColor, thickness: 4),
                const SizedBox(width: 10),
                SizedBox(
                    width: width * .6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(task.title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: AppTheme.primarylightColor)),
                        const SizedBox(height: 25),
                        Text(task.desc ?? '',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    )),
              ],
            )),
          ),
        ),
        Positioned(
          right: 10,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppTheme.primarylightColor)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * .01, horizontal: width * .01),
              child: const Icon(Icons.check, size: 29),
            ),
          ),
        )
      ],
    );
  }
}
