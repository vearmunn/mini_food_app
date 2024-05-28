// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mini_food_app/themes/light_theme.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.hint,
    this.obscure = false,
    required this.controller,
  });

  final String hint;
  final bool obscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: primary)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: lightGrey!))),
    );
  }
}
