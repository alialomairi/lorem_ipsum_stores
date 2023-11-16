import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtUsername,
                decoration: const InputDecoration(
                    label: Text('Full Name'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtUsername,
                decoration: const InputDecoration(
                    label: Text('UserName'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txtPassword,
                decoration:const  InputDecoration(
                    label: Text('Password'),
                    border:  OutlineInputBorder()
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () async{
                  final email = txtUsername.value.text;
                  final password = txtPassword.value.text;
                  try {
                    final creds = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: email, password: password);
                    final sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.setString('key', creds.user?.email??'');
                    Navigator.pop(context);
                   }
                  on FirebaseAuthException catch(e){

                  }
                },
                child: const Text('Register'),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
