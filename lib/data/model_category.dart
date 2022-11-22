class CategoryDummy {
  final String id;
  final String name;
  final String image;

  CategoryDummy(
    this.id,
    this.name,
    this.image,
  );
}

final List<CategoryDummy> categoryDummy = [
  CategoryDummy("25", "Camera", "assets/category/camera.png"),
  CategoryDummy("23", "Handphone", "assets/category/handphone.png"),
  CategoryDummy("26", "Laptop", "assets/category/laptop.png"),
  CategoryDummy("1", "Makanan", "assets/category/makanan.png"),
  CategoryDummy("24", "Printer", "assets/category/printer.png"),
];

class CategoryById {
  final int idProduct;
  final String name;
  final int category;
  final String image;
  final String description;
  final int? stok;
  final int harga;

  CategoryById(
  {required this.idProduct,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.stok,
    required this.harga,}
  );

  factory CategoryById.fromJson(Map<String, dynamic> json) {
    return CategoryById(
      idProduct: json['id'],
      name: json['name'],
      category: json['category_id'],
      description: json['deskripsi'],
      image: json['image'],
      stok: json['stok'],
      harga: json['harga'],
    );
  }
}
