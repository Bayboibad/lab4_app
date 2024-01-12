import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_app/composents/button.dart';
import 'package:lab4_app/configs/string.dart';
import 'package:lab4_app/views/home/account/update_account.dart';
import 'package:lab4_app/views/login/login_screen.dart';
import 'package:lab4_app/views/logup/bloc/logup_bloc.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.accountApp),
      ),
      body: BlocConsumer<LogupBloc, LogupState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange),
                    child: Icon(
                      Icons.ac_unit_rounded,
                      size: 150,
                      color: Colors.cyanAccent.shade100,
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateAccount(),
                                ));
                          },
                          child: ItemAcount(StyleTitiles.updateAccountApp),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ItemAcount(StyleTitiles.settingApp),
                        )
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: ButtonElv(
                        onTap: () {
                          context.read<LogupBloc>().add(ButtonLoguot());
                        },
                        title: StyleTitiles.logoutApp),
                  ),
                )
              ],
            ),
          );
        },
        listener: (BuildContext context, LogupState state) {
          if (state is SubmitLoguot) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          }
        },
      ),
    );
  }
}

Widget ItemAcount(String title) {
  return Container(
    height: 60,
    margin: EdgeInsets.only(top: 8),
    decoration: BoxDecoration(
        color: Colors.amber.shade200, borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Expanded(
            flex: 8,
            child: Container(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))),
        Expanded(flex: 2, child: Icon(Icons.arrow_forward_ios_sharp)),
      ],
    ),
  );
}
