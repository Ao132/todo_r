import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_r/flutter_utiles.dart';
import 'package:todo_r/model/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> tasksList = [];
  DateTime selectedDate = DateTime.now();

  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseUtils.getTasksCollection().get();
    tasksList = querySnapshot.docs.map((doc) => doc.data()).toList();

    tasksList = tasksList.where((task) {
      if (selectedDate.day == task.dateTime?.day &&
          selectedDate.month == task.dateTime?.month &&
          selectedDate.year == task.dateTime?.year) {
        return true;
      }
      return false;
    }).toList();
    tasksList.sort(
        (Task task1, Task task2) => task1.dateTime!.compareTo(task2.dateTime!));

    notifyListeners();
  }

  isDoneChanger(Task task, bool newValue) {
    task.isDone = newValue;
    FirebaseUtils.updateTaskStatusFirebase(task, newValue);
    notifyListeners();
  }

  setNewSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    getAllTasksFromFireStore();
  }
}
