import 'package:flutter/material.dart';
import 'package:todo_r/theme/app_theme.dart';
import 'package:todo_r/settings/theme_bottom_sheet.dart';
import 'package:todo_r/settings/lang_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        alignment: Alignment.topLeft,
        height: 170,
        width: double.infinity,
        color: AppTheme.primaryLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Language', style: Theme.of(context).textTheme.displayMedium),
            InkWell(
              onTap: () {
                langBottomSheet();
              },
              child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryLight), color: AppTheme.whiteColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: AppTheme.primaryLight,
                      )
                    ],
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Text(
              'Themeing',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            InkWell(
              onTap: () {
                themeingBottomSheet();
              },
              child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryLight), color: AppTheme.whiteColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Light',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: AppTheme.primaryLight,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void langBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) => const LangBottomSheet());
  }

  void themeingBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) => const ThemeBottomSheet());
  }
}
