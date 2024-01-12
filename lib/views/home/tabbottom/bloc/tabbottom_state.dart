part of 'tabbottom_bloc.dart';

@immutable
sealed class TabbottomState {}

final class TabbottomInitial extends TabbottomState {}

class ButtonTab extends TabbottomState{
  final int tabIndex;
  ButtonTab({required this.tabIndex});

  List<Object> get props => [tabIndex];
}
