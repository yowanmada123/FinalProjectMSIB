// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:resto_mobile/data/model_category.dart';

import 'model_products.dart';

class Repository {
  Future<List<Products>> getProdacts() async {
    final response = await http.get(
        Uri.parse(
          'https://api1.sib3.nurulfikri.com/api/barang',
        ),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 764|Ah4FLvZbWwUfDXsnkpF6IXcPqHNT6G6i9Q7zknNV',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data'];
      return responseJson.map((data) => Products.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<CategoryById>> getCategory(String id) async {
    final response = await http.get(
        Uri.parse(
          'https://api1.sib3.nurulfikri.com/api/category/$id',
        ),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 764|Ah4FLvZbWwUfDXsnkpF6IXcPqHNT6G6i9Q7zknNV',
          HttpHeaders.contentTypeHeader: 'application/json',
        });

    if (response.statusCode == 200) {
      List responseJson = (json.decode(response.body))['data']['products'];
      print(responseJson);
      return responseJson.map((data) => CategoryById.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
