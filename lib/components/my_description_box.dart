import 'package:flutter/material.dart';
import 'package:mini_food_app/themes/light_theme.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: lightGrey!, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Rp 10.000',
                style: TextStyle(fontWeight: FontWeight.bold, color: tertiary),
              ),
              Text(
                'Delivery Fee',
                style: TextStyle(color: tertiary),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '15-30 mins',
                style: TextStyle(fontWeight: FontWeight.bold, color: tertiary),
              ),
              Text(
                'Delivery Time',
                style: TextStyle(color: tertiary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
