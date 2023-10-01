import 'package:flutter/material.dart';
import 'package:todo_r/home/settings/settings_tab.dart';
import 'package:todo_r/home/task_list/add_task_bsheet.dart';
import 'package:todo_r/home/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('To Do List',
                style: Theme.of(context).textTheme.displayLarge),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 7,
          child: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              iconSize: 32,
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addTask();
            },
            child: const Icon(Icons.add, size: 35)),
        body: tabs[selectedIndex]);
  }

  List<Widget> tabs = [const TaskListTab(), const SettingsTab()];

  void addTask() {
    showModalBottomSheet(
        context: context, builder: (context) => const AddTaskBSheet());
  }
}
