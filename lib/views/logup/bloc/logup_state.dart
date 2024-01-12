part of 'logup_bloc.dart';

@immutable
sealed class LogupState {}

final class LogupInitial extends LogupState {}

class LoadingState extends LogupState {}

class SumitLogup extends LogupState {}

class SubmitLoguot extends LogupState{}

class ErrorLogup extends LogupState {
  final String error;
  ErrorLogup({required this.error});
  List<Object> get props => [error];
}
