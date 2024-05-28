// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mini_food_app/components/spacer.dart';

import '../components/mybutton.dart';
import '../components/mytextfield.dart';
import '../services/auth/auth_service.dart';
import '../themes/light_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController cpasswordController = TextEditingController();

  Future register() async {
    final authService = AuthService();

    if (passwordController.text == cpasswordController.text) {
      try {
        await authService.signUp(emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Sign Up failed!',
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
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Sign Up failed!',
          ),
          content: const Text('Password doesnt match!'),
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
                  "Let's create an account for you",
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
                verticalSpace(10),
                MyTextfield(
                  obscure: true,
                  controller: cpasswordController,
                  hint: 'Confirm Password',
                ),
                verticalSpace(25),
                MyButton(
                  text: 'Register',
                  onTap: register,
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: tertiary),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Sign In',
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
