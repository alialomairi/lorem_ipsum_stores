import 'dart:convert';

import 'package:http/http.dart' as http;
import '';

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['title'],
        json['description'],
        json['price'],
        'laptop.jpg'
    );
  }

  static Future<List<Product>> getProducts() async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var products = <Product>[];
      var jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      var mapList = jsonMap['products'] as List<dynamic>;
      for (int i = 0; i < mapList.length; i++) {
        var product = Product.fromJson(mapList[i]);
        products.add(product);
      }
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      var jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      return Product.fromJson(jsonMap);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}