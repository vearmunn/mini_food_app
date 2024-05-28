import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_food_app/components/spacer.dart';
import 'package:mini_food_app/model/cart_item.dart';
import 'package:mini_food_app/model/restauran_model.dart';
import 'package:mini_food_app/pages/payment_page.dart';
import 'package:mini_food_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

import '../components/mybutton.dart';
import '../components/quantity_selector.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Are you sure you want to clear the cart?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  restaurant.clearCart();
                                },
                                child: const Text('Yes')),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: tertiary,
                  ))
            ],
          ),
          body: restaurant.cart.isEmpty
              ? Center(
                  child: Text(
                  'Cart is empty',
                  style: TextStyle(fontSize: 18, color: tertiary),
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          padding: const EdgeInsets.all(20),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userCart.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cartItem = userCart[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          cartItem.food.imagePath,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      horizontalSpace(12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItem.food.name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              "\$${cartItem.food.price}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: tertiary),
                                            )
                                          ],
                                        ),
                                      ),
                                      horizontalSpace(8),
                                      QuantitySelector(
                                        cartItem: cartItem,
                                        onIncrement: () {
                                          restaurant.addToCart(cartItem.food,
                                              cartItem.selectedAddons);
                                        },
                                        onDecrement: () {
                                          restaurant.removeFromCart(cartItem);
                                        },
                                      ),
                                    ],
                                  ),
                                  verticalSpace(
                                      cartItem.selectedAddons.isEmpty ? 0 : 12),
                                  SizedBox(
                                    height: cartItem.selectedAddons.isEmpty
                                        ? 0
                                        : 40,
                                    child: ListView.builder(
                                      itemCount: cartItem.selectedAddons.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final selectedAddons =
                                            cartItem.selectedAddons[index];
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(right: 12),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  width: 1, color: lightGrey!)),
                                          child: Center(
                                            child: Text(
                                              '${selectedAddons.name} (\$${selectedAddons.price})',
                                              style: const TextStyle(
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                      verticalSpace(50)
                    ],
                  ),
                ),
          bottomSheet: MyButton(
            text: 'Go to Checkout',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ));
            },
          ),
        );
      },
    );
  }
}
