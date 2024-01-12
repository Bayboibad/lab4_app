import 'package:flutter/material.dart';

class iconBtn extends StatelessWidget {
  final Icon icon;
  final Function() onTap;
  final double size;
  const iconBtn({super.key, required this.icon, required this.onTap, required this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: icon, iconSize: size,);
  }
}
