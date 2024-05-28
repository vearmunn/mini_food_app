// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/cart_item.dart';
import '../themes/light_theme.dart';
import 'spacer.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.cartItem,
    required this.onDecrement,
    required this.onIncrement,
  });

  final CartItem cartItem;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 15,
              color: tertiary,
            ),
          ),
          horizontalSpace(8),
          Text(cartItem.quantity.toString()),
          horizontalSpace(8),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 15,
              color: tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
