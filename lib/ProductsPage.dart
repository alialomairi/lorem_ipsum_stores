import 'package:flutter/material.dart';
import 'package:lorem_ipsum_stores/Product.dart';
import 'package:lorem_ipsum_stores/ProductBox.dart';
import 'package:lorem_ipsum_stores/ProductPage.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final items = Product.getProducts();
  late Future<List<Product>> productsLate;
  @override
  void initState() {
    super.initState();
    productsLate = Product.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Navigation")),
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
