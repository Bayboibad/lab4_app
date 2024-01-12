part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class LoadingProduct extends ProductState{}

class SubmitProduct extends ProductState{
  final List<Product> list;
  SubmitProduct({required this.list});

  List<Object> get props => [list];
}

class ErrorProduct extends ProductState{
  final String error;
  ErrorProduct({required this.error});
  List<Object> get props => [error];
}