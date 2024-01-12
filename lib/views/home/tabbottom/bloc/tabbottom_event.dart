part of 'tabbottom_bloc.dart';

@immutable
sealed class TabbottomEvent {}

class TabBottom extends TabbottomEvent {
  final int index;
  TabBottom({required this.index});

  List<Object> get props => [index];
}
