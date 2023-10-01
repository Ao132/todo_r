import 'package:flutter/material.dart';
import 'package:todo_r/app_theme.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  static const String routeName = 'edit_screen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
      ),
      body: Stack(children: [
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * .03, horizontal: width * .03),
            margin: EdgeInsets.symmetric(
                vertical: height * .06, horizontal: width * .07),
            decoration: BoxDecoration(color: AppTheme.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Edit Task',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: ''),
                ),
                TextFormField(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
