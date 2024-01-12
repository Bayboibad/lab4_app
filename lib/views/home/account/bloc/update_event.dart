part of 'update_bloc.dart';

@immutable
sealed class UpdateEvent {}

class ButtonUpdate extends UpdateEvent{
  final String username;
  final String email;

  ButtonUpdate({required this.username , required this.email});

  List<Object> get props => [username,email];
}
