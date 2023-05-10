import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:todo_r/model/task.dart';
import 'package:todo_r/fire_base_utiles.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';
  String desc = '';
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text('Add new Task', style: Theme.of(context).textTheme.titleMedium),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Title';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      title = text;
                    },
                    decoration: const InputDecoration(labelText: 'Enter Task Title'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Description ';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      desc = text;
                    },
                    decoration: const InputDecoration(labelText: 'Enter Task Title'),
                    maxLines: 4,
                    minLines: 4,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Selected Day',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () => chooseDate(),
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text(
                        'add',
                        style: Theme.of(context).textTheme.displayLarge,
                      ))
                ],
              ))
        ],
      ),
    );
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      Task task = Task(title: title, desc: desc, date: selectedDate.microsecondsSinceEpoch);
      addTaskToFireStore(task).timeout(
        const Duration(milliseconds: 500),
        onTimeout: () {
          log('todo was added');
          Navigator.pop(context);
        },
      );
    }
  }

  chooseDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
