part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class CountEvent extends ProductEvent {
  final int count;
  CountEvent({required this.count});
  List<Object> get props => [count];
}
