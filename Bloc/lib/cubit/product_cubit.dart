import 'package:umkm_bloc/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class productCubit extends Cubit<ProductModel> {
  String url = "http://127.0.0.1:8000/detil_product/";
  productCubit()
        : super(ProductModel(
              id: 0,
              title: "",
              price: 0.0,
              description: "",
              category: "",
              image: "",
              rating: RatingModel(rate: 0.0, count: 0)));

  void setFromJson(Map<String, dynamic> json) {
      emit(ProductModel(
          id: json['id'],
          title: json['title'],
          price: json['price'],
          description: json['description'],
          category: json['category'],
          image: json['image'],
          rating: RatingModel.fromJson(json['rating'])));
  }

  void fetchData(String id) async {
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
