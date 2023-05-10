import 'package:flutter/material.dart';
import 'package:todo_r/settings/settings_tab.dart';
import 'package:todo_r/task_list/add_task_bottom_sheet.dart';
import 'package:todo_r/theme/app_theme.dart';
import 'package:todo_r/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const routeName = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   'To Do List',
      //   style: Theme.of(context).textTheme.displayLarge,
      // )),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: SelectedIndex,
            onTap: (index) {
              SelectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(label: 'Task List', icon: Icon(Icons.menu)),
              BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTaskBottomSheet();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35), side: const BorderSide(color: AppTheme.whiteColor, width: 4)),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[SelectedIndex],
    );
  }

  List<Widget> tabs = [const TaskListTab(), const SettingsTab()];

  void showTaskBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) =>  AddTaskBottomSheet());
  }
}
