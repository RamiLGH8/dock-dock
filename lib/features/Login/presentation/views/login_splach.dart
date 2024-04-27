import 'package:flutter/material.dart';

class LoginSplash extends StatefulWidget {
  const LoginSplash({super.key});

  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Welcome to',
              style: TextStyle(color: Colors.blue, fontSize: 40),
            ),
            Image.asset('images/images 1.png'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login_form');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text('Login'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
