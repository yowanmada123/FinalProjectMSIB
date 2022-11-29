import 'package:timelines/timelines.dart';

class Pivot {
  final int qty;

  const Pivot({required this.qty});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(qty: json['qty']);
  }
}

class ItemOrder {
  final int idProduct;
  final String name;
  final int category;
  final String image;
  final String description;
  final int stock;
  final int harga;
  final Pivot pivot;

  const ItemOrder({
    required this.idProduct,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.stock,
    required this.harga,
    required this.pivot,
  });

  factory ItemOrder.fromJson(Map<String, dynamic> json) {
    return ItemOrder(
      idProduct: json['id'],
      name: json['name'],
      category: json['category_id'],
      description: json['deskripsi'],
      image: json['image'],
      stock: json['stock'] == null ? 0 : json['stock'],
      harga: json['harga'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class BuyHostory {
  final String status;
  final String alamat;
  final int total;
  final String dateOrder;
  final List<ItemOrder> products;

  const BuyHostory({
    required this.status,
    required this.alamat,
    required this.total,
    required this.dateOrder,
    required this.products,
  });

  factory BuyHostory.fromJson(Map<String, dynamic> json) {
    var products = <ItemOrder>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(ItemOrder.fromJson(v));
      });
    }
    return BuyHostory(
      alamat: json['alamat'],
      status: json['status'],
      total: json['total'],
      dateOrder: json['created_at'],
      products: products,
    );
  }
}
