import 'package:resto_mobile/data/model_products.dart';

class Chart {
  final int id;
  final int userId;
  final int productId;
  final int qty;
  final String createdAt;
  final String updatedAt;
  final Products product;

  const Chart({
    required this.id, 
    required this.userId, 
    required this.productId, 
    required this.qty, 
    required this.createdAt, 
    required this.updatedAt, 
    required this.product});

  factory Chart.fromJson(Map<String, dynamic> json) {
    return Chart(
      id: json['id'], 
      userId: json['user_id'], 
      productId: json['product_id'], 
      qty: json['qty'], 
      createdAt: json['created_at'], 
      updatedAt: json['updated_at'], 
      product: Products.fromJson(json['product']));
  }
}
