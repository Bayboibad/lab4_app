// ignore_for_file: must_be_immutable

part of 'update_bloc.dart';

@immutable
sealed class UpdateState {}

final class UpdateInitial extends UpdateState {}

class SubmitUpdate extends UpdateState{}
