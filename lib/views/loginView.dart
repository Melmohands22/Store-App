import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(''),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
