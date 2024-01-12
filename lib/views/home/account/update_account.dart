import 'package:flutter/material.dart';
import 'package:lab4_app/composents/button.dart';
import 'package:lab4_app/configs/string.dart';

class UpdateAccount extends StatelessWidget {
  const UpdateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StyleTitiles.updateAccountApp)),
      body: Container(
        margin: EdgeInsets.all(16),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Expanded(
                flex: 2,
                child: Icon(
                  Icons.ac_unit_rounded,
                  size: 150,
                  color: Colors.blue.shade100,
                )),
            Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: [],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child:
                      ButtonElv(onTap: () {}, title: StyleTitiles.update),
                ))
          ],
        ),
      ),
    );
  }
}
