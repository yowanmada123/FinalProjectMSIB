class Products {
  final int idProduct;
  final String name;
  final int category;
  final String image;
  final String description;
  final int stock;
  final int harga;

  const Products({
    required this.idProduct,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.stock,
    required this.harga,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      idProduct: json['id'],
      name: json['name'],
      category: json['category_id'],
      description: json['deskripsi'],
      image: json['image'],
      stock: json['stock'] == null ? 0 : json['stock'],
      harga: json['harga'],
    );
  }
}
