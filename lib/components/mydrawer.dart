import 'package:flutter/material.dart';
import 'package:mini_food_app/components/spacer.dart';
import 'package:mini_food_app/services/auth/auth_service.dart';
import 'package:mini_food_app/themes/light_theme.dart';

import 'mydrawertile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Future signout() async {
    final authService = AuthService();

    try {
      authService.signOut();
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
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          verticalSpace(50),
          Icon(
            Icons.food_bank,
            size: 100,
            color: primary,
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(),
          ),
          MyDrawerTile(
            icon: Icons.home,
            text: 'H O M E',
            onTap: () {},
          ),
          MyDrawerTile(
            icon: Icons.settings,
            text: 'S E T T I N G S',
            onTap: () {},
          ),
          const Spacer(),
          MyDrawerTile(
            icon: Icons.logout,
            text: 'L O G O U T',
            onTap: signout,
          ),
          verticalSpace(25)
        ],
      ),
    );
  }
}
