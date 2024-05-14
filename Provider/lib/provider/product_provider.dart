import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';
import 'package:http/http.dart' as http;

class UserDataProvider with ChangeNotifier {
  String url = "http://127.0.0.1:8000/daftar_product";
  List<ProductModel> _userProvider = [];

  List<ProductModel> get userData => _userProvider;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> userData = jsonDecode(response.body)['data'];
        _userProvider = userData.map((data) => ProductModel.fromJson(data)).toList();

        // Infokan bahwa data telah berubah
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<ProductModel?> fetchProductDetail(int index) async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/detil_product/$index'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> productData = jsonDecode(response.body);
        return ProductModel.fromJson(productData);
      } else {
        throw Exception('Failed to load product detail');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}


