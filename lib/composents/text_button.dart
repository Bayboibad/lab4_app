import 'package:flutter/material.dart';
import 'package:lab4_app/configs/colors.dart';

class TextBtn extends StatelessWidget {
  final Function() onTap;
  final String title;
  const TextBtn({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(color: StyleColors.colorBlue),
        ));
  }
}
