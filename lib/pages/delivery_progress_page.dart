import 'package:flutter/material.dart';
import 'package:mini_food_app/components/spacer.dart';
import 'package:mini_food_app/model/restauran_model.dart';
import 'package:mini_food_app/services/database/firestore.dart';
import 'package:mini_food_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FirestoreService db = FirestoreService();
  @override
  void initState() {
    super.initState();

    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress...'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(25),
            const Center(
                child: Text(
              'Thank you for your order!',
              style: TextStyle(fontSize: 18),
            )),
            verticalSpace(25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: tertiary!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) =>
                    Text(restaurant.displayCartReceipt()),
              ),
            ),
            verticalSpace(100),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Firman Handi Pratama',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: tertiary),
                  ),
                  Text(
                    'Driver',
                    style: TextStyle(fontSize: 12, color: tertiary),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.message,
                color: tertiary,
              ),
            ),
            horizontalSpace(12),
            const CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.phone,
                color: Color.fromARGB(127, 76, 175, 79),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
