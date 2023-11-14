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
                    label: Text('UserName'),
                    border:  OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
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
                onPressed: (){
                  String username = txtUsername.value.text;
                  String password = txtPassword.value.text;
                  if( username == 'ali' && password == '123') {
                    Navigator.pop(context);
                  }
                  else{
                    showDialog(
                        context: context,
                        builder: (builder)=>
                            AlertDialog(
                              title:const Text('Login failure'),
                              content: const Text('Username or password is not correct.'),
                              actions: [
                                TextButton(
                                    onPressed: ()=>Navigator.pop(context, 'OK'),
                                    child: const Text('OK')
                                )
                              ],
                    ));
                  }
                },
                child: const Text('Login'),
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
