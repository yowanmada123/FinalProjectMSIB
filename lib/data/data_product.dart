class FavoriteProduct {
  final String name;
  final String sold;
  final String description;
  final String image;
  final String firstprice;
  final String finalprice;
  final String category;
  final String imagecategory;

  FavoriteProduct(
    this.name,
    this.sold,
    this.description,
    this.image,
    this.firstprice,
    this.finalprice,
    this.category, this.imagecategory,
  );
}

final List<FavoriteProduct> allData = [
  FavoriteProduct('Hemat Gila 80%', '80DE', 'Hemat belanjamu hingga 80%', 'assets/images/diskon4.jpg', '28', '15', 'Drinks', 'assets/images/ic_category_drinks.png'),
  FavoriteProduct('Ongkos Kirim Segala Penjuru', '0NGK', 'Hilangkan ongkos kirimmu', 'assets/images/diskon5.jpg', '25', '16', 'Food', 'assets/images/ic_category_food.png'),
  FavoriteProduct('Diskon Manja 12.12', '12.12A', 'Diskon 12 Desember', 'assets/images/diskon3.jpg', '20', '17', 'Cake', 'assets/images/ic_category_drinks.png'),
  FavoriteProduct('Diskon Dunia Akhirat', '2023', 'Diskon nyawa dunia', 'assets/images/diskon1.jpg', '21', '15', 'Snack', 'assets/images/ic_category_snack.png'),
  FavoriteProduct('MANJA MANJA AW', 'MMA2W', 'Diskon Manja Manja Shop', 'assets/images/diskon2.jpg', '23', '11', 'Donuts', 'assets/images/ic_category_donut.png'),
  FavoriteProduct('MANJA GILA !!!', 'MANGo', 'Manjakan harimu dengan bissmillah', 'assets/images/diskon6.jpg', '22', '20', 'Pasta', 'assets/images/ic_category_pasta.png'),
  FavoriteProduct('Gratis Ongkos Packing', '2000', 'Gratis ongkos packing 2k', 'assets/images/diskon7.jpg', '23', '121', 'Biscuit', 'assets/images/ic_category_biscuit.png'),
  FavoriteProduct('Liburan Ke Hawai', 'LL1KH', 'Ajak semua keluargamu', 'assets/images/diskon8.jpg', '28', '27', 'Waffle', 'assets/images/ic_category_waffle.png'),
  // FavoriteProduct('Jungle Cake', '2500', 'Jungle Party, for Everyone', '','assets/images/morefood3.jpg'),
];
