
import 'package:flutter/material.dart';
import 'package:lab4_app/composents/button.dart';
import 'package:lab4_app/composents/text_form.dart';
import 'package:lab4_app/configs/string.dart';

class UpdateAccount extends StatefulWidget {
  final String username;
  final String email;
  UpdateAccount({super.key, required this.username, required this.email});

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();



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
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, top: 32, right: 0, bottom: 4),
                        child: TextForm(
                          controller: usernameController,
                          title: widget.username,
                          icon: Icon(Icons.account_circle),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, top: 8, right: 0, bottom: 4),
                        child: TextForm(
                          controller: emailController,
                          title: widget.email,
                          icon: Icon(Icons.email_outlined),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ButtonElv(onTap: () {}, title: StyleTitiles.update),
                ))
          ],
        ),
      ),
    );
  }
}
