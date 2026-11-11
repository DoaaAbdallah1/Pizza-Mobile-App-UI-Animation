import 'package:pizza_mobile_app_ui/core/constants/app_assets.dart';

class Pizza {
  final String name;
  final String description;
  final String image;
  final Map<String, double> prices;

  const Pizza({
    required this.name,
    required this.description,
    required this.image,
    required this.prices,
  });

  double getPrice(String size) {
    return prices[size] ?? prices['M'] ?? 0;
  }
}

class PizzaData {
  static const List<Pizza> pizzas = [
    Pizza(
      name: 'Midnight Harvest',
      description: "This pizza celebrates the rich and bold flavors of black olives paired with a medley of cheeses. The deep, earthy taste of black olives harmonizes beautifully with the creamy, melted cheeses.",
      image: AppAssets.pizzaComplete3,
      prices: {'S': 11.99, 'M': 16.99, 'L': 20.99},
    ),
    Pizza(
      name: 'Pepperoni Blast',
      description: "The combination of perfectly melted mozzarella cheese, tangy tomato sauce, and a crispy yet chewy crust creates a harmonious balance that leaves you wanting more. ",
      image: AppAssets.pizzaComplete2,
      prices: {'S': 12.99, 'M': 17.99, 'L': 21.99},
    ),
    Pizza(
      name: 'Shrimptastic',
      description: "This pizza showcases the perfect combination of shrimp and cheese, with gooey melted cheeses complementing the savory shrimp toppings for a truly indulgent experience.",
      image: AppAssets.pizzaComplete1,
      prices: {'S': 10.99, 'M': 15.99, 'L': 19.99},
    ),
  ];
}
