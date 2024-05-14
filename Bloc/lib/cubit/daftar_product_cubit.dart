import 'package:product_bloc/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class productListCubit extends Cubit<List<ProductModel>> {
  String url = "http://127.0.0.1:8000/daftar_product";
  productListCubit()
        : super([
            ProductModel(
                id: 0,
                title:"",
                price: 0,
                description: "",
                category: "",
                image: "",
                rating: RatingModel(rate: 0.0, count: 0))
          ]);


  //map dari json ke atribut
void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<ProductModel> productList = data
        .map((e) => ProductModel(
            id: e['id'],
            title: e['title'],
            price: e['price'],
            description: e['description'],
            category: e['category'],
            image: e['image'],
            rating: RatingModel.fromJson(e['rating'])))
        .toList();
    emit(productList);
}


  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
