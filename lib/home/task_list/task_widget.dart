// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:todo_r/app_theme.dart';
import 'package:todo_r/flutter_utiles.dart';
import 'package:todo_r/home/screens/edit_screen.dart';
import 'package:todo_r/model/task.dart';
import 'package:todo_r/providers/list_provider.dart';

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
    ListProvider provider = Provider.of(context);
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .04),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Slidable(
            startActionPane: ActionPane(
              extentRatio: .5,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  onPressed: (context) {
                    FirebaseUtils.deleteTaskFromFireStore(task).timeout(
                      const Duration(milliseconds: 700),
                      onTimeout: () {
                        Fluttertoast.showToast(
                            msg: "Task Deleted Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 10,
                            backgroundColor: AppTheme.primarylightColor,
                            textColor: AppTheme.blackColor,
                            fontSize: 23);
                        provider.getAllTasksFromFireStore();
                      },
                    );
                  },
                  backgroundColor: AppTheme.redColor,
                  foregroundColor: AppTheme.whiteColor,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  onPressed: (context) {
                    Navigator.of(context).pushNamed(EditScreen.routeName);
                  },
                  backgroundColor: AppTheme.editColor,
                  foregroundColor: AppTheme.whiteColor,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * .03, horizontal: width * .03),
              decoration: BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IntrinsicHeight(
                  child: Row(
                children: [
                  task.isDone!
                      ? VerticalDivider(
                          color: AppTheme.greenColor, thickness: 4)
                      : VerticalDivider(
                          color: AppTheme.primarylightColor, thickness: 4),
                  const SizedBox(width: 10),
                  SizedBox(
                      width: width * .6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(task.title ?? '',
                              style: task.isDone!
                                  ? Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: AppTheme.greenColor)
                                  : Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: AppTheme.primarylightColor)),
                          const SizedBox(height: 25),
                          Text(task.desc ?? '',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      )),
                ],
              )),
            ),
          ),
          task.isDone!
              ? InkWell(
                  child: Text(
                    'Done',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: AppTheme.greenColor),
                  ),
                  onTap: () {
                    provider.isDoneChanger(task, false);
                  },
                )
              : Positioned(
                  right: 10,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.isDoneChanger(task, true);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppTheme.primarylightColor)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .01, horizontal: width * .01),
                      child: const Icon(Icons.check, size: 29),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
