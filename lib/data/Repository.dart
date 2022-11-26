// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:resto_mobile/data/model_wishlists.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model_products.dart';

class Repository {
  
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

  Future<List<Products>> getProdacts() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
          'https://api1.sib3.nurulfikri.com/api/barang',
        ),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data'];
      return responseJson.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Products>> getCategory(String id) async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
          'https://api1.sib3.nurulfikri.com/api/category/$id',
        ),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data']['products'];
      print(responseJson);
      return responseJson.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Wishlists>> getWishlists() async {
    var token = await getToken();
    final response = await http.get(
        Uri.parse(
          'https://api1.sib3.nurulfikri.com/api/wishlist',
        ),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data'];
      // print(responseJson);
      return responseJson.map((data) => Wishlists.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
