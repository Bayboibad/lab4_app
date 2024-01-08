import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab4_app/configs/colors.dart';
import 'package:lab4_app/firebase_options.dart';
import 'package:lab4_app/provider/provider_password.dart';
import 'package:lab4_app/provider/validate_user.dart';
import 'package:lab4_app/splash.dart';
import 'package:lab4_app/views/login/bloc/login_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      ChangeNotifierProvider<PasswordProvider>(
        create: (context) => PasswordProvider(),
      ),
      ChangeNotifierProvider<MyValidate>(
        create: (context) => MyValidate(),
      ),
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: StyleColors.colorBackgroud),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
