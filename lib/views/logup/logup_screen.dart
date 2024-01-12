import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_app/composents/button.dart';
import 'package:lab4_app/composents/text_form.dart';
import 'package:lab4_app/configs/images.dart';
import 'package:lab4_app/configs/string.dart';
import 'package:lab4_app/provider/provider_password.dart';
import 'package:lab4_app/views/login/login_screen.dart';
import 'package:lab4_app/views/logup/bloc/logup_bloc.dart';
import 'package:provider/provider.dart';

class LogupPage extends StatelessWidget {
  LogupPage({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final iconCheck = Provider.of<PasswordProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.logup),
      ),
      body: BlocConsumer<LogupBloc, LogupState>(
        listener: (context, state) {
          if (state is ErrorLogup) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is SumitLogup) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 114,
                    height: 114,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage(StyleImages.logoApp))),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 32, right: 0, bottom: 4),
                    child: TextForm(
                      controller: usernameController,
                      title: StyleTitiles.titleUsername,
                      icon: Icon(Icons.account_circle_sharp),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 4, right: 0, bottom: 4),
                    child: TextForm(
                      controller: emailController,
                      title: StyleTitiles.titleEmail,
                      icon: Icon(Icons.email_outlined),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 4, right: 0, bottom: 4),
                    child: TextFormPass(
                        controller: passwordController,
                        isPassword: iconCheck.isPasswordLogup,
                        iconButton: IconButton(
                            onPressed: () {
                              iconCheck.togglePasswordVisibilityLogup();
                            },
                            icon: Icon(iconCheck.isPasswordLogup
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        title: StyleTitiles.titlePassword),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 4, right: 0, bottom: 4),
                    child: TextFormPass(
                        controller: rePasswordController,
                        isPassword: iconCheck.isRePasswordLogup,
                        iconButton: IconButton(
                            onPressed: () {
                              iconCheck.toggleRePasswordVisibilityLogup();
                            },
                            icon: Icon(iconCheck.isRePasswordLogup
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        title: StyleTitiles.titleRePass),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ButtonElv(
                        onTap: () {
                          context.read<LogupBloc>().add(ButtonLogupEvent(
                              username: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              rePassword: rePasswordController.text));
                        },
                        title: StyleTitiles.logup),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 70,
                    child: DemoLogup(context),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget DemoLogup(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage(StyleImages.facebookApp),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          width: 32,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage(StyleImages.googleApp),
                    fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          width: 32,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage(StyleImages.twiterApp),
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    ),
  );
}
