import 'package:flutter/material.dart';
import 'package:lorem_ipsum_stores/LoginPage.dart';
import 'package:lorem_ipsum_stores/ProductsPage.dart';
import 'package:lorem_ipsum_stores/RegisterPage.dart';

import 'ProductEdit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('HomePage'),
        actions: [
          TextButton(
              onPressed: (){
              },
              child: const Text('Login')
          ),
          TextButton(
              onPressed: (){
                Navigator.push( context, MaterialPageRoute(builder: (context) => const RegisterPage()), );
              },
              child: const Text('Register')
          ),
        ],
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: (){
              Navigator.push( context, MaterialPageRoute(builder: (context) => const ProductsPage()), );
            },
            child: Text('Products'),
          ),
          TextButton(
            onPressed: (){
              Navigator.push( context, MaterialPageRoute(builder: (context) => const ProductEdit()), );
            },
            child: Text(' add Product'),
          ),
        ],
      )
    );
  }
}
