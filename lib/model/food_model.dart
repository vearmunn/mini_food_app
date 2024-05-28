// ignore_for_file: public_member_api_docs, sort_constructors_first
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;
  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

enum FoodCategory { burgers, salads, sides, desserts, drinks }

class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
