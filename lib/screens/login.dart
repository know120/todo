import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Log In',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.mail),
          label: Text('Login with Google'),
        )
      ],
    );
  }
}
