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

class AllCategory {
  final int id;
  final String name;

  AllCategory({
    required this.id,
    required this.name,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) {
    return AllCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}
