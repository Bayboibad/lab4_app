// ignore_for_file: unnecessary_cast, unused_element

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lab4_app/api/api_product.dart';
import 'package:lab4_app/models/product.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiProduct api;
  ProductBloc({required this.api}) : super(ProductInitial()) {
    on<CountEvent>((event, emit) async {
      if (event.count == 0) {
        emit(ErrorProduct(error: "Không có sản phẩm"));
      }else if(event.count >= 10){
         var list = await api.getDataProducts(event.count);
         print("hahahhaha ${event.count}");
        emit(SubmitProduct(list: list));
      }
       else {
       emit(ErrorProduct(error: "Lỗi thật rồi"));
      }
    });

    on<SearchItem>((event, emit) async {
           if (event.search.isEmpty) {
            emit(LoadingProduct()); 
           }else {
         var list = await api.getDataProducts(100);
        emit(SubmitProduct(list: list));
      }
    });
  }
}
