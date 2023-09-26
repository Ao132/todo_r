import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_r/app_theme.dart';
import 'package:todo_r/flutter_utiles.dart';
import 'package:todo_r/model/task.dart';
import 'package:todo_r/providers/list_provider.dart';

class AddTaskBSheet extends StatefulWidget {
  const AddTaskBSheet({super.key});

  @override
  State<AddTaskBSheet> createState() => _AddTaskBSheetState();
}

class _AddTaskBSheetState extends State<AddTaskBSheet> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat.yMMMd();
  String title = '';
  String desc = '';
  late ListProvider listProvider;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .04, vertical: height * .02),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add New Task',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center),
            TextFormField(
              onChanged: (text) => title = text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Title';
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text('Enter Task Title'),
                  labelStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: height * .02),
            TextFormField(
              maxLines: 2,
              minLines: 2,
              onChanged: (text) => desc = text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Description';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Enter Task Description',
                  labelStyle: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: height * .04),
            Text(
              'Selected Date',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: height * .02),
            GestureDetector(
              onTap: () => chooseDate(),
              child: Text(
                dateFormat.format(selectedDate),
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * .03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .04),
              child: ElevatedButton(
                onPressed: () {
                  addTask();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.primarylightColor)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * .02),
                  child: Text(
                    'Add',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  chooseDate() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      Task task = Task(title: title, desc: desc, dateTime: selectedDate);
      FirebaseUtils.addTaskToFireStore(task).timeout(
        const Duration(milliseconds: 500),
        onTimeout: () {
          Fluttertoast.showToast(
              msg: "Task Added Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 10,
              backgroundColor: AppTheme.primarylightColor,
              textColor: AppTheme.blackColor,
              fontSize: 23);
          listProvider.getAllTasksFromFireStore();
          Navigator.pop(context);
        },
      );
    }
  }
}
