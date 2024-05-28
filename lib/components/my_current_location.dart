import 'package:flutter/material.dart';
import 'package:mini_food_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

import '../model/restauran_model.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchbox(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Location'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter address...'),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              context
                  .read<Restaurant>()
                  .updateDeliveryAdress(textController.text);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: tertiary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchbox(context),
            child: Container(
              child: Row(
                children: [
                  Consumer<Restaurant>(
                    builder: (context, restaurant, child) => Text(
                      restaurant.deliveryAddress,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
