// ignore_for_file: must_be_immutable

part of 'update_bloc.dart';

@immutable
sealed class UpdateState {}

final class UpdateInitial extends UpdateState {}

class SubmitUpdate extends UpdateState {}

class DataUser extends UpdateState {
  final String username;
  final String email;

  DataUser({required this.username, required this.email});

  List<Object> get props => [username, email];
}

class ErrorUpdate extends UpdateState {
  final String error;
  ErrorUpdate({required this.error});
  List<Object> get props => [error];
}

class ButtonLoveState extends UpdateState {
  final bool favorite;

  ButtonLoveState({required this.favorite});

  List<Object> get props => [favorite];
}

class DataFav extends UpdateState {
   final List<Fav> favList;
  DataFav({required this.favList});
  List<Object> get props => [favList];
}
class SumitDelFav extends UpdateState{}
