class Item {
  String name;
  int price;
  String description;

  Item({
    required this.name,
    required this.price,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'description': description,
      };
}

// Temporary Data for Testing Purposes Only (Will be replaced with API)
List<Item> items = [
  Item(
    name: 'Organic Cat Food',
    price: 150000,
    description:
        'Premium organic cat food with real chicken',
  ),
  Item(
    name: 'Cat Litter Box',
    price: 300000,
    description: 'Large, easy-to-clean litter box for cat',
  ),
];
