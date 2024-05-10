import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/model/user.dart';
import 'package:http/http.dart' as http;

class UserDataProvider with ChangeNotifier {
  String url = "https://randomuser.me/api/";
  User? _userProvider;

  User? get userData => _userProvider;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body)['results'][0];
        _userProvider = User.fromJson(userData);

        // Infokan bahwa data telah berubah
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
