// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mini_food_app/components/spacer.dart';
import 'package:mini_food_app/themes/light_theme.dart';

import '../model/food_model.dart';

class MyFoodTile extends StatelessWidget {
  const MyFoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  final Food food;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        food.price.toString(),
                        style: TextStyle(color: tertiary),
                      ),
                      verticalSpace(10),
                      Text(
                        food.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                horizontalSpace(10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          indent: 15,
          endIndent: 15,
          color: lightGrey,
        )
      ],
    );
  }
}
