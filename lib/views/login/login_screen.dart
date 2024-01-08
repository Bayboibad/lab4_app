import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4_app/composents/button.dart';
import 'package:lab4_app/composents/text_button.dart';
import 'package:lab4_app/composents/text_form.dart';
import 'package:lab4_app/configs/images.dart';
import 'package:lab4_app/configs/string.dart';
import 'package:lab4_app/provider/provider_password.dart';
import 'package:lab4_app/views/home_page.dart';
import 'package:lab4_app/views/login/bloc/login_bloc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var isPassword = Provider.of<PasswordProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StyleTitiles.loginApp),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
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
                  SizedBox(
                    height: 64,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 32, right: 0, bottom: 4),
                    child: TextForm(
                      controller: emailController,
                      title: StyleTitiles.titleEmail,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 4),
                    child: TextFormPass(
                      controller: passwordController,
                      isPassword: isPassword.isPassword,
                      iconButton: IconButton(
                        onPressed: () {
                          isPassword.togglePasswordVisibilityLogin();
                        },
                        icon: Icon(isPassword.isPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      title: StyleTitiles.titlePassword,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 4),
                    child: ButtonElv(
                        onTap: () {
                          context.read<LoginBloc>().add(ButtonLoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        title: StyleTitiles.loginApp),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child:
                        TextBtn(onTap: () {}, title: StyleTitiles.titleLogup),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is SumitLogin) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePgae(),
                ));
          } else if (state is ErrorLogin) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
      ),
    );
  }
}
