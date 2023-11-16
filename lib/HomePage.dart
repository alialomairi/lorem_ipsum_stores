import 'package:flutter/material.dart';
import 'package:lorem_ipsum_stores/LoginPage.dart';
import 'package:lorem_ipsum_stores/ProductsPage.dart';
import 'package:lorem_ipsum_stores/RegisterPage.dart';
import 'package:lorem_ipsum_stores/Product.dart';
import 'package:lorem_ipsum_stores/ProductBox.dart';
import 'package:lorem_ipsum_stores/ProductPage.dart';

import 'ProductEdit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> productsLate;
  @override
  void initState() {
    super.initState();
    productsLate = Product.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text('Lorem Ipsum Stores')
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => const LoginPage()), );
              },
            ),
            ListTile(
              title: const Text('Register'),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => const RegisterPage()), );
              },
            ),
            ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => const ProductsPage()), );
              },
            ),
            ListTile(
              title: const Text('Add Product'),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => ProductEdit()), );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('HomePage'),
      ),
      body: FutureBuilder<List<Product>>(
            future: productsLate,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<Product>;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: ProductBox(item: items[index]),
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => ProductPage(item: items[index]),
                        ),
                        );
                      },
                    );},
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )

    );
  }
}
