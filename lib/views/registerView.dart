import 'package:flutter/material.dart';
import 'package:store_app/widgets/customButton.dart';
import 'package:store_app/widgets/customTextField.dart';
import 'package:store_app/widgets/passwordTextField.dart';

class Registerview extends StatefulWidget {
  const Registerview({
    super.key,
  });
  static String id = 'Registerview';

  @override
  State<Registerview> createState() => _LoginViewState();
}

class _LoginViewState extends State<Registerview> {
  String? email, password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s Register Account ',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Hello user , you have a greatful journey',
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
                height: 15,
              ),
              PasswordTextField(
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: Colors.black,
                ),
                obscureText: true,
                hintText: 'Confirm Password',
                onChanged: (value) {
                  password = value;
                },
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'Sign up ',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ? '),
                  TextButton(
                    child: Text('Login Now'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
