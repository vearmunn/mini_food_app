// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:mini_food_app/components/mybutton.dart';
import 'package:mini_food_app/components/spacer.dart';

import 'package:mini_food_app/model/food_model.dart';
import 'package:mini_food_app/model/restauran_model.dart';
import 'package:mini_food_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  FoodPage({
    super.key,
    required this.food,
  }) {
    // initialize selected addon to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  final Food food;

  final Map<Addon, bool> selectedAddons = {};

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.food.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(Icons.arrow_back))),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${widget.food.price}',
                    style: TextStyle(color: tertiary, fontSize: 16),
                  ),
                  verticalSpace(10),
                  Text(widget.food.description),
                  verticalSpace(15),
                  Divider(
                    color: lightGrey,
                  ),
                  verticalSpace(15),
                  Text(
                    'Addon',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: tertiary),
                  ),
                  ListView.builder(
                    itemCount: widget.food.availableAddons.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Addon addon = widget.food.availableAddons[index];
                      return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '\$${addon.price}',
                            style: TextStyle(color: tertiary),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          });
                    },
                  ),
                  verticalSpace(50)
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: MyButton(
        text: 'Add to Cart',
        onTap: () => addToCart(widget.food, widget.selectedAddons),
      ),
    );
  }
}
