part of 'update_bloc.dart';

@immutable
sealed class UpdateEvent {}

class ButtonUpdate extends UpdateEvent {
  final String username;
  final String email;

  ButtonUpdate({required this.username, required this.email});

  List<Object> get props => [username, email];
}

class ButtonDate extends UpdateEvent {
  final String userId;

  ButtonDate({required this.userId});

  List<Object> get props => [userId];
}

class ButtonLove extends UpdateEvent {
  final int productId;
  final String userId;

  ButtonLove({required this.productId, required this.userId});

  List<Object> get props => [productId, userId];
}

class ButtonFav extends UpdateEvent{
  final String id;
  ButtonFav({required this.id});

  List<Object> get props => [id];
}


