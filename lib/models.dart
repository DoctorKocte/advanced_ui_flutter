class HolidayCategory {
  HolidayCategory({required this.name, required this.type, required this.imageString});

  String name;
  HolidayType type;
  String imageString;
}

class SaleCategory {
  SaleCategory(
      {required this.name, required this.saleType, required this.imageString});

  String name;
  SaleType saleType;
  String imageString;
}

class SaleCard {
  SaleCard(
      {required this.name,
      required this.price,
      required this.imageString,
      required this.isFavorite,
      required this.saleType});

  String name;
  int price;
  String imageString;
  bool isFavorite;
  SaleType saleType;
}

enum SaleType {
  none,
  flower,
  candy,
  cake;

  String get title {
    switch (this) {
      case SaleType.flower:
        return 'Цветы';
      case SaleType.cake:
        return 'Торты';
      case SaleType.candy:
        return 'Конфеты';
      case SaleType.none:
        return '';
    }
  }

  String get imageString {
    switch (this) {
      case SaleType.flower:
        return 'assets/images/flower.png';
      case SaleType.cake:
        return 'assets/images/flower.png';
      case SaleType.candy:
        return 'assets/images/candy.png';
      case SaleType.none:
        return 'assets/images/settings.png';
    }
  }
}

enum HolidayType {
  birthday,
  valentineDay,
  womenDay,
  newYear,
  menDay;
}

class ShopModel {
  ShopModel({
    required this.name,
    required this.rate,
    required this.purchasesCount,
    required this.commentsCount,
    required this.imageString
  });
  
  String name;
  double rate;
  int purchasesCount;
  int commentsCount;
  String imageString;
}
