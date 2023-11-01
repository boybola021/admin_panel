import 'menu_model.dart';

class OrderModel{
  final String name;
  final String id;
  final String email;
  final String phone;
  final int personCount;
  final String deta;
  final String time;
  final List<OrderModelProduct> products;
  OrderModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.personCount,
    required this.deta,
    required this.time,
    required this.products,
  });

  factory OrderModel.fromJson(Map<String,Object?> json){
    return OrderModel(
        name: json["id"] as String,
        id: json["name"] as String,
        email: json["email"] as String,
        phone: json["phone"] as String,
        personCount: json["personCount"] as int,
        deta: json["deta"] as String,
        time: json["time"] as String,
        products: (json["products"] as List).map((e) => OrderModelProduct.fromJson(e as Map<String,Object>)).toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id &&
          email == other.email &&
          phone == other.phone &&
          personCount == other.personCount &&
          deta == other.deta &&
          time == other.time &&
          products == other.products;

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      personCount.hashCode ^
      deta.hashCode ^
      time.hashCode ^
      products.hashCode;
}

class OrderModelProduct{
  final int quantity;
  final MenuModel products;
  OrderModelProduct({required this.quantity,required this.products});

  factory OrderModelProduct.fromJson(Map<String,Object?> json){
    return OrderModelProduct(
        quantity: json["quantity"] as int,
        products: MenuModel.fromJson(json["products"] as Map<String,Object?>),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelProduct &&
          runtimeType == other.runtimeType &&
          quantity == other.quantity &&
          products == other.products;

  @override
  int get hashCode => quantity.hashCode ^ products.hashCode;

  @override
  String toString() {
    return 'OrderModelProduct{quantity: $quantity, products: $products}';
  }
}


class Product {
  MenuModel products;
  int quantity;

  Product({
    required this.products,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, Object?> json) => Product(
    products: MenuModel.fromJson(json["products"] as Map<String,Object?>),
    quantity: json["quantity"] as int,
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
    "quantity": quantity,
  };
}

