import 'package:flutter/material.dart';

class LangBottomSheet extends StatelessWidget {
  const LangBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .2,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(onTap: () {}, child: getSelectedLangWidget(context, 'en')),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          GestureDetector(
            onTap: () {},
            child: getUnSelectedLangWidget(context, 'ar'),
          ),
        ],
      ),
    );
  }

  Text getUnSelectedLangWidget(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.amber),
    );
  }

  Row getSelectedLangWidget(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
