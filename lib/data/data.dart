class FavoriteProduct {
  final String name;
  final String sold;
  final String description;
  final String image;
  final String firstprice;
  final String finalprice;

  FavoriteProduct(
    this.name,
    this.sold,
    this.description,
    this.image, 
    this.firstprice, 
    this.finalprice,
  );
}

final List<FavoriteProduct> allData = [
  FavoriteProduct('Strawberry Cake', '843', 'Hungarian cake for Desert', 'assets/images/morefood1.jpg', '200.000', '150.000'),
  FavoriteProduct('Chocolate Cake', '1850', 'Bakemono Japanese Cake', 'assets/images/morefood2.jpg', '200.000', '150.000'),
  FavoriteProduct('Vanilla Cake', '2000', 'Food Party, for cake', 'assets/images/morefood3.jpg', '200.000', '150.000'),
  FavoriteProduct('Chocolate Cake', '1850', 'Bakemono Japanese Cake', 'assets/images/morefood2.jpg', '200.000', '150.000'),
  FavoriteProduct('Strawberry Cake', '843', 'Hungarian cake for Desert', 'assets/images/morefood1.jpg', '200.000', '150.000'),
  FavoriteProduct('Chocolate Cake', '1850', 'Bakemono Japanese Cake', 'assets/images/morefood2.jpg', '200.000', '150.000'),
  FavoriteProduct('Vanilla Cake', '2000', 'Food Party, for cake', 'assets/images/morefood3.jpg', '200.000', '150.000'),
  FavoriteProduct('Chocolate Cake', '1850', 'Bakemono Japanese Cake', 'assets/images/morefood2.jpg', '200.000', '150.000'),
  // FavoriteProduct('Jungle Cake', '2500', 'Jungle Party, for Everyone', '','assets/images/morefood3.jpg'),
];
