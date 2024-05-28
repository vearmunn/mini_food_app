import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'food_model.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burger
    Food(
        name: 'Classic Beef Burger',
        description:
            'Juicy beef patty topped with fresh lettuce, ripe tomatoes, onions, and pickles, served on a toasted sesame seed bun',
        imagePath: 'assets/images/burger1.jpg',
        price: 8.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Bacon', price: 1.25),
          Addon(name: 'Cheddar Cheese', price: 0.75),
          Addon(name: 'Avocado', price: 1.00)
        ]),
    Food(
        name: 'BBQ Bacon Burger',
        description:
            'Grilled beef patty glazed with tangy barbecue sauce, topped with crispy bacon strips, melted cheddar cheese, and crispy onion rings on a brioche bun.',
        imagePath: 'assets/images/burger2.jpg',
        price: 10.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Fried Egg', price: 1.25),
          Addon(name: 'Jalapenos', price: 0.50),
          Addon(name: 'Extra BBQ Sauce', price: 0.50)
        ]),
    Food(
        name: 'Mushroom Swiss Burger',
        description:
            'Savory beef patty topped with sautéed mushrooms, melted Swiss cheese, caramelized onions, and a creamy garlic aioli on a toasted artisan bun.',
        imagePath: 'assets/images/burger3.jpg',
        price: 9.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Grilled Pineapple', price: 1.00),
          Addon(name: 'Truffle Mayo', price: 0.75),
          Addon(name: 'Extra Swiss Cheese', price: 0.50)
        ]),
    Food(
        name: 'Mushroom Swiss Burger',
        description:
            'Savory beef patty topped with sautéed mushrooms, melted Swiss cheese, caramelized onions, and a creamy garlic aioli on a toasted artisan bun.',
        imagePath: 'assets/images/burger4.jpg',
        price: 9.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Grilled Pineapple', price: 1.00),
          Addon(name: 'Truffle Mayo', price: 0.75),
          Addon(name: 'Extra Swiss Cheese', price: 0.50)
        ]),
    Food(
        name: 'Spicy Chicken Sriracha Burger',
        description:
            'Crispy fried chicken breast coated in spicy sriracha sauce, topped with pepper jack cheese, jalapeno slices, lettuce, and sriracha mayo on a toasted ciabatta roll.',
        imagePath: 'assets/images/burger5.jpg',
        price: 9.49,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Bacon', price: 1.50),
          Addon(name: 'Fried Pickles', price: 0.75),
          Addon(name: 'Extra Sriracha Sauce', price: 0.50)
        ]),

    // salad
    Food(
      name: 'Classic Caesar Salad',
      description:
          'Crisp romaine lettuce tossed with garlic croutons, shredded Parmesan cheese, and classic Caesar dressing.',
      imagePath: 'assets/images/salad1.jpg',
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken Breast', price: 3.00),
        Addon(name: 'Shrimp', price: 4.00),
        Addon(name: 'Avocado', price: 1.50)
      ],
    ),

    Food(
      name: 'Greek Salad',
      description:
          'Fresh mixed greens topped with tomatoes, cucumbers, red onions, Kalamata olives, feta cheese, and Greek vinaigrette.',
      imagePath: 'assets/images/salad2.jpg',
      price: 10.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Salmon', price: 5.00),
        Addon(name: 'Artichoke Hearts', price: 1.50),
        Addon(name: 'Pepperoncini', price: 0.75)
      ],
    ),

    Food(
      name: 'Cobb Salad',
      description:
          'A hearty mix of chopped lettuce, grilled chicken, crispy bacon, hard-boiled eggs, diced tomatoes, avocado, and blue cheese crumbles with ranch dressing.',
      imagePath: 'assets/images/salad3.jpg',
      price: 11.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Shrimp', price: 4.50),
        Addon(name: 'Sliced Turkey', price: 3.00),
        Addon(name: 'Candied Pecans', price: 1.25)
      ],
    ),

    Food(
      name: 'Asian Sesame Chicken Salad',
      description:
          'Sliced grilled chicken breast served atop mixed greens, mandarin oranges, sliced almonds, crispy wonton strips, and sesame ginger dressing.',
      imagePath: 'assets/images/salad4.jpg',
      price: 10.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Tofu', price: 2.50),
        Addon(name: 'Edamame', price: 1.00),
        Addon(name: 'Chow Mein Noodles', price: 0.75)
      ],
    ),

    Food(
      name: 'Caprese Salad',
      description:
          'Sliced ripe tomatoes, fresh mozzarella cheese, and basil leaves drizzled with balsamic glaze and extra virgin olive oil.',
      imagePath: 'assets/images/salad5.jpg',
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Prosciutto', price: 3.00),
        Addon(name: 'Grilled Chicken', price: 3.00),
        Addon(name: 'Pesto Sauce', price: 1.25)
      ],
    ),

    // sides

    // desserts

    Food(
      name: 'New York Cheesecake',
      description:
          'Creamy and rich cheesecake made with a traditional New York-style recipe, served with a choice of strawberry or raspberry coulis.',
      imagePath: 'assets/images/cheesecake.jpg',
      price: 6.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Chocolate Ganache Drizzle', price: 1.50),
        Addon(name: 'Whipped Cream', price: 0.75),
        Addon(name: 'Fresh Berries', price: 1.00)
      ],
    ),

    Food(
      name: 'Molten Lava Cake',
      description:
          'Warm chocolate cake with a gooey molten chocolate center, served with a scoop of vanilla ice cream and chocolate sauce.',
      imagePath: 'assets/images/lavacake.jpg',
      price: 7.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Caramel Drizzle', price: 1.00),
        Addon(name: 'Chopped Nuts', price: 0.75),
        Addon(name: 'Espresso Whipped Cream', price: 1.25)
      ],
    ),

    Food(
      name: 'Classic Tiramisu',
      description:
          'Layers of espresso-soaked ladyfingers and creamy mascarpone cheese, dusted with cocoa powder and served with a side of whipped cream.',
      imagePath: 'assets/images/tiramisu.jpg',
      price: 8.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Kahlua Infusion', price: 2.00),
        Addon(name: 'Chocolate Shavings', price: 1.00),
        Addon(name: 'Amaretto Soaked Almonds', price: 1.50)
      ],
    ),

    Food(
      name: 'Apple Pie a la Mode',
      description:
          'Homemade apple pie filled with cinnamon-spiced apples, served warm with a scoop of vanilla ice cream and caramel sauce.',
      imagePath: 'assets/images/slick.jpg',
      price: 7.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Cheddar Cheese Crust', price: 1.50),
        Addon(name: 'Toasted Pecans', price: 1.00),
        Addon(name: 'Bourbon Caramel Sauce', price: 2.00)
      ],
    ),

    Food(
      name: 'Triple Chocolate Brownie Sundae',
      description:
          'Fudgy chocolate brownie served warm with chocolate sauce, chopped nuts, and a scoop of chocolate and vanilla ice cream.',
      imagePath: 'assets/images/brownie.jpg',
      price: 9.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Marshmallow Fluff', price: 1.25),
        Addon(name: 'Oreo Crumbles', price: 0.75),
        Addon(name: 'Peanut Butter Drizzle', price: 1.50)
      ],
    ),

//sides
    Food(
      name: 'Garlic Parmesan Fries',
      description:
          'Crispy golden fries tossed in garlic butter and Parmesan cheese, served with a side of marinara sauce.',
      imagePath: 'assets/images/fries1.jpg',
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Truffle Oil Drizzle', price: 1.50),
        Addon(name: 'Bacon Bits', price: 1.25),
        Addon(name: 'Ranch Dressing', price: 0.75)
      ],
    ),

    Food(
      name: 'Onion Rings',
      description:
          'Thick-cut onions coated in seasoned batter and fried to a golden brown, served with a zesty dipping sauce.',
      imagePath: 'assets/images/onion.jpg',
      price: 5.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Chipotle Mayo', price: 0.75),
        Addon(name: 'Sriracha Ketchup', price: 0.50),
        Addon(name: 'Jalapeno Slices', price: 1.00)
      ],
    ),

    Food(
      name: 'Loaded Nachos',
      description:
          'Crispy tortilla chips piled high with melted cheddar cheese, black beans, diced tomatoes, jalapenos, sour cream, and guacamole.',
      imagePath: 'assets/images/nachos.jpg',
      price: 8.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Spicy Ground Beef', price: 2.50),
        Addon(name: 'Grilled Chicken', price: 3.00),
        Addon(name: 'Salsa Fresca', price: 1.00)
      ],
    ),

    Food(
      name: 'Sweet Potato Fries',
      description:
          'Crisp sweet potato fries seasoned with sea salt and served with a side of honey mustard dipping sauce.',
      imagePath: 'assets/images/fries2.jpg',
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cajun Spice Dusting', price: 1.00),
        Addon(name: 'Maple Syrup Drizzle', price: 1.25),
        Addon(name: 'Chipotle Aioli', price: 0.75)
      ],
    ),

    Food(
      name: 'Mozzarella Sticks',
      description:
          'Golden-fried mozzarella cheese sticks served with marinara sauce for dipping.',
      imagePath: 'assets/images/slick.jpg',
      price: 6.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Buffalo Sauce', price: 0.75),
        Addon(name: 'Pesto Mayo', price: 0.75),
        Addon(name: 'Parmesan Herb Crust', price: 1.00)
      ],
    ),

    // drinks
    Food(
      name: 'Mango Tango Smoothie',
      description:
          'A refreshing blend of ripe mangoes, Greek yogurt, and orange juice, served chilled.',
      imagePath: 'assets/images/mango.jpg',
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Protein Powder', price: 1.50),
        Addon(name: 'Spinach Boost', price: 1.00),
        Addon(name: 'Coconut Flakes', price: 0.75)
      ],
    ),

    Food(
      name: 'Iced Caramel Macchiato',
      description:
          'Smooth espresso combined with creamy milk and sweet caramel syrup, served over ice.',
      imagePath: 'assets/images/machiato.jpg',
      price: 4.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Shot of Espresso', price: 1.00),
        Addon(name: 'Vanilla Syrup', price: 0.50),
        Addon(name: 'Whipped Cream', price: 0.75)
      ],
    ),

    Food(
      name: 'Classic Mojito',
      description:
          'A refreshing mix of muddled fresh mint, lime juice, sugar, and rum, topped with soda water and ice.',
      imagePath: 'assets/images/mojito.jpg',
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Strawberry Puree', price: 1.50),
        Addon(name: 'Blueberry Infusion', price: 1.00),
        Addon(name: 'Coconut Rum Float', price: 2.00)
      ],
    ),

    Food(
      name: 'Berry Blast Lemonade',
      description:
          'Tangy lemonade infused with a medley of mixed berries and a hint of honey, served over crushed ice.',
      imagePath: 'assets/images/lemonade.jpg',
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Fresh Basil Leaves', price: 0.75),
        Addon(name: 'Raspberry Syrup', price: 0.50),
        Addon(name: 'Sparkling Water', price: 1.00)
      ],
    ),

    Food(
      name: 'Matcha Green Tea Latte',
      description:
          'Creamy steamed milk mixed with Japanese matcha green tea powder and a touch of honey, served hot or iced.',
      imagePath: 'assets/images/greentea.jpg',
      price: 5.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Almond Milk Substitute', price: 0.75),
        Addon(name: 'Vanilla Bean Paste', price: 1.00),
        Addon(name: 'Matcha Whipped Cream', price: 1.25)
      ],
    ),
  ];

  List<Food> get menu => _menu;

/*

OPERATIONS

*/

  String _deliveryAddress = 'Ciawi';
  String get deliveryAddress => _deliveryAddress;

// user cart
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

// add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

// remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// get total price of cart

  double getTotalPrice() {
    double total = 0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

// get total numver of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// update delivery address
  void updateDeliveryAdress(String address) {
    _deliveryAddress = address;
    notifyListeners();
  }
/*

HELPERS

*/

// generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('----------------');

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln('----------------');
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

// format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

// format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((e) => "${e.name} (${_formatPrice(e.price)})").join(", ");
  }
}
