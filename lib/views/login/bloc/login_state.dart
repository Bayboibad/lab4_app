part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingLogin extends LoginState{}

class SumitLogin extends LoginState{}

class ErrorLogin extends LoginState{
  final String error;
  ErrorLogin({required this.error});

  List<Object> get props => [error];
}