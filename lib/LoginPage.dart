import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
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
                    label: Text('UserName'), border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: txtPassword,
                decoration: const InputDecoration(
                    label: Text('Password'), border: OutlineInputBorder()),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () async {
                  String username = txtUsername.value.text;
                  String password = txtPassword.value.text;

                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: username, password: password);
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'INVALID_LOGIN_CREDENTIALS') {

                      showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                            title: const Text('Login failure'),
                            content:  Text(e.message??'his'),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'OK'),
                                  child: const Text('OK'))
                            ],
                          ));
                    }
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (builder) => AlertDialog(
                          title: const Text('Login failure'),
                          content:  Text('his'),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'OK'),
                                child: const Text('OK'))
                          ],
                        ));
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
