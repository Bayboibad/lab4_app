import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab4_app/api/api_product.dart';
import 'package:lab4_app/configs/colors.dart';
import 'package:lab4_app/firebase_options.dart';
import 'package:lab4_app/provider/provider_password.dart';
import 'package:lab4_app/views/home/bloc/product_bloc.dart';
import 'package:lab4_app/views/home/tabbottom/bloc/tabbottom_bloc.dart';
import 'package:lab4_app/views/login/bloc/login_bloc.dart';
import 'package:lab4_app/views/logup/bloc/logup_bloc.dart';
import 'package:lab4_app/views/splash.dart';
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
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<LogupBloc>(
        create: (context) => LogupBloc(),
      ),
      BlocProvider<TabbottomBloc>(
        create: (context) => TabbottomBloc(),
      ),
      BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(api: ApiProduct()),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
        colorScheme:
            ColorScheme.fromSeed(seedColor: StyleColors.colorBackgroud),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
