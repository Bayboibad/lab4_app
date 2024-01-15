part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class CountEvent extends ProductEvent {
  final int count;
  CountEvent({required this.count});
  List<Object> get props => [count];
}

class SearchItem extends ProductEvent {
  final String search;
  SearchItem({required this.search});
  List<Object> get props => [search];
}
