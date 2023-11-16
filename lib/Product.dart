import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;


class Product {
  String? key;
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['title'],
        json['description']??'',
        json['price']??0,
        json['thumbnail']??''
    );
  }

  factory  Product.fromMap(Map<Object?, Object?> json) {
    return Product(
        json['title'].toString()??'',
        json['description'].toString()??'',
        int.parse(json['price'].toString()??''),
        json['thumbnail'].toString()??''
    );
  }
Map<String, dynamic> toMap() {
    return  <String, dynamic>{
      'title': name,
      'description': description,
      'price':price,
      'thumbnail':image
     };
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
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    String? key = ref.child("products").push().key;
    await ref.child("products/$key").set(product.toMap());
    product.key = key;
    return product;
  }
  static Future<Product> getProduct(String key) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    final DataSnapshot snapshot = await ref.child("products/$key").get();
    final value = snapshot.value as Map<Object?,Object?>;


     return Product.fromMap(value);
    // return snapshot.value as Product;
  }
}