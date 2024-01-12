part of 'logup_bloc.dart';

@immutable
sealed class LogupEvent {}

class ButtonLogupEvent extends LogupEvent {
  final String username;
  final String email;
  final String password;
  final String rePassword;

  ButtonLogupEvent(
      {required this.username,
      required this.email,
      required this.password,
      required this.rePassword});

  List<Object> get props => [username, email, password, rePassword];
}

class ButtonLoguot extends LogupEvent{}