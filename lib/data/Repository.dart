// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'model.dart';

class Repository {
  Future<List<Products>> fetchAlbum() async {
    final response = await http.get(
        Uri.parse(
          'https://api1.sib3.nurulfikri.com/api/barang?sortBy=name&sortOrder=ASC',
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
}
