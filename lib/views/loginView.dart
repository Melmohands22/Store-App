import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/customButton.dart';
import 'package:store_app/widgets/customTextField.dart';
import 'package:store_app/widgets/passwordTextField.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s sign you in ',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome Back ,                   you have been missed',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
                hintText: 'Email',
                inputType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              PasswordTextField(
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Colors.black,
                ),
                obscureText: true,
                hintText: 'Password',
                onChanged: (value) {
                  password = value;
                },
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'forgat password ?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'Sign in ',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account ? '),
                  TextButton(
                    child: Text('Register Now'),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
