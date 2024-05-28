// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mini_food_app/components/spacer.dart';
import 'package:mini_food_app/services/auth/auth_service.dart';

import '../components/mybutton.dart';
import '../components/mytextfield.dart';
import '../themes/light_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future login() async {
    final authService = AuthService();

    try {
      await authService.signIn(emailController.text, passwordController.text);
    } catch (e) {
      print(e.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Login failed!',
          ),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.food_bank,
                  size: 100,
                  color: primary,
                ),
                verticalSpace(8),
                Text(
                  'Food Delivery App',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: tertiary),
                ),
                verticalSpace(25),
                MyTextfield(
                  controller: emailController,
                  hint: 'Email',
                ),
                verticalSpace(10),
                MyTextfield(
                  obscure: true,
                  controller: passwordController,
                  hint: 'Password',
                ),
                verticalSpace(25),
                MyButton(
                  text: 'Sign In',
                  onTap: login,
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: TextStyle(color: tertiary),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: tertiary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
