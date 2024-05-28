// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mini_food_app/pages/cart_page.dart';
import 'package:mini_food_app/themes/light_theme.dart';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({
    super.key,
    required this.child,
    required this.title,
  });

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: bgColor,
      expandedHeight: 340,
      // collapsedHeight: 120,
      centerTitle: true,
      title: const Text('F O O D ? !'),
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const CartPage()));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: title,
      ),
      flexibleSpace: FlexibleSpaceBar(
        // title: title,
        titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        centerTitle: true,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: child,
        ),
      ),
    );
  }
}
