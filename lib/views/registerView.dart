import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubit_State/auth_State.dart';
import 'package:store_app/cubits/auth_Cubit.dart';
import 'package:store_app/views/homeView.dart';
import 'package:store_app/widgets/customButton.dart';
import 'package:store_app/widgets/customTextField.dart';
import 'package:store_app/widgets/passwordTextField.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              setState(() {
                isLoading = true;
              });
            } else {
              setState(() {
                isLoading = false;
              });
            }
            if (state is AuthSuccessToRegisteState) {
              Navigator.pushReplacementNamed(context, HomeView.id);
            } else if (state is AuthFaildToRegisteState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Let\'s Register Account',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hello user, you have a great journey ahead',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 40),
                        CustomTextField(
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          controller: usernameController,
                          hintText: 'Username',
                          label: const Text('Username'),
                          message: 'Username is required',
                          inputType: TextInputType.text,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          controller: phoneController,
                          hintText: 'Phone Number',
                          label: const Text('Phone'),
                          message: 'Phone Number is required',
                          inputType: TextInputType.phone,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
                          label: const Text('Email'),
                          controller: emailController,
                          hintText: 'Email',
                          message: 'Email is required',
                          inputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),
                        PasswordTextField(
                          controller: passwordController,
                          labelText: 'Password',
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          title: 'Sign up',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              print('Username: ${usernameController.text}');
                              print('Email: ${emailController.text}');
                              print('Phone: ${phoneController.text}');
                              print('Password: ${passwordController.text}');

                              BlocProvider.of<AuthCubit>(context).register(
                                name: usernameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account? '),
                            TextButton(
                              child: const Text(
                                'Login Now',
                                style: TextStyle(color: Colors.orange),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
