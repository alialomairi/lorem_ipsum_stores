import 'package:flutter/material.dart';
import 'package:lorem_ipsum_stores/LoginPage.dart';
import 'package:lorem_ipsum_stores/RegisterPage.dart';

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
        title: const Text('HomePage'),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push( context, MaterialPageRoute(builder: (context) => const LoginPage()), );
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
      body:  const Text('This is the Home Page'),
    );
  }
}
