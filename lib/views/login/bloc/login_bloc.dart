// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ButtonLoginEvent>((event, emit) async {
      RegExp expEmail = RegExp(
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
      User? auth = await FirebaseAuth.instance.currentUser;
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(ErrorLogin(error: "Không để trống"));
      } else if (!expEmail.hasMatch(event.email)) {
        emit(ErrorLogin(error: "Không đúng định dạng Email"));
      } else {
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(SumitLogin());
        } catch (e) {
          print(e);
          emit(ErrorLogin(error: "Đăng nhập không thành công"));
        }
      }
    });
  }
}
