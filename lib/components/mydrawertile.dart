// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../themes/light_theme.dart';

class MyDrawerTile extends StatelessWidget {
  const MyDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: tertiary,
        ),
        title: Text(
          text,
          style: TextStyle(color: tertiary),
        ),
      ),
    );
  }
}
