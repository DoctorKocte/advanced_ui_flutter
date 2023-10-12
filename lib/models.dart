class SaleCategory {
  SaleCategory({
    required this.name,
    required this.imageString
  });

  String name;
  String imageString;
}

class SaleCard {
  SaleCard({
    required this.name,
    required this.price,
    required this.imageString,
    required this.isFavorite,
    required this.saleType
  });

  String name;
  int price;
  String imageString;
  bool isFavorite;
  SaleType saleType;
}

enum SaleType {
  flower, cake
}