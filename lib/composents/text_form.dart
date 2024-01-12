import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Icon icon;
  const TextForm({super.key, required this.controller, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        border: OutlineInputBorder(),
        hintText: title,
      ),
    );
  }
}

class TextFormPass extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final IconButton iconButton;
  final String title;
  const TextFormPass({super.key, required this.controller, required this.isPassword, required this.iconButton, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:  controller,
      obscureText: isPassword,
    
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.enhanced_encryption_outlined),
          border: OutlineInputBorder(),
          hintText: title,
          suffixIcon:iconButton,
          
      )
    );
  }
}
