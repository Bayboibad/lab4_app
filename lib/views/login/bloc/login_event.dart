part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ButtonLoginEvent extends LoginEvent{
  final String email;
  final String password;

  ButtonLoginEvent({required this.email,required this.password});

  List<Object> get props =>[email,password];
}