import 'package:flutter/material.dart';
import 'package:lab4_app/configs/string.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.favourApp),
      ),
    );
  }
}