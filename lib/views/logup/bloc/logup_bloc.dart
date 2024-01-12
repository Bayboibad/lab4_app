// ignore_for_file: unused_element

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'logup_event.dart';
part 'logup_state.dart';

class LogupBloc extends Bloc<LogupEvent, LogupState> {
  LogupBloc() : super(LogupInitial()) {
    on<ButtonLogupEvent>((event, emit) async {
      if (event.username.isEmpty ||
          event.email.isEmpty ||
          event.password.isEmpty ||
          event.rePassword.isEmpty) {
        emit(ErrorLogup(error: "Không để trống"));
      } else if (event.password != event.rePassword) {
        emit(ErrorLogup(error: "Mật khẩu trùng nhau"));
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(SumitLogup());
          await FirebaseFirestore.instance
              .collection("user")
              .doc(userCredential.user!.uid)
              .set({
            "username": event.username,
            "email": event.email,
            "password": "********",
            "favourite": false,
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
    });

    on<ButtonLoguot>((event, emit) async {
      try {
        await FirebaseAuth.instance.signOut();
        emit(SubmitLoguot());
      } catch (e) {
        print(e);
      }
    });
  }
}
