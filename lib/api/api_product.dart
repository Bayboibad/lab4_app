import 'package:dio/dio.dart';
import 'package:lab4_app/configs/string.dart';
import 'package:lab4_app/models/product.dart';

class ApiProduct {
  Future<List<Product>> getDataProducts(int count) async {
    var response = await Dio()
        .get("${StyleTitiles.apiUrl}/products?limit=${count.toInt()}");
    if (response.statusCode == 200) {
      final jsons = response.data["products"] as List;
      var result = jsons
          .map((e) => Product(
              id: e['id'],
              title: e['title'],
              description: e['description'],
              price: e['price'],
              discountPercentage: e['discountPercentage'],
              rating: e['rating'],
              stock: e['stock'],
              brand: e['brand'],
              category: e['category'],
              thumbnail: e['thumbnail'],
              images: e['images']))
          .toList();
      print("Longgggg  ${result.toString()}");
      return result;
    } else {
      throw ("lỗi server");
    }
  }
}
