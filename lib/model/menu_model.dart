
class MenuModel {
  final String id;
  final String name;
  final String description;
  final num price;
  final String imageUrl;
  final String category;

  const MenuModel(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.price,
        required this.imageUrl,
      }
);

  factory MenuModel.fromJson(Map<String, Object?> json) {
    return MenuModel(
      id: json["id"] as String,
      name: json["name"] as String,
      description: json["description"] as String,
      category: json["category"] as String,
      price: json["price"] as num,
      imageUrl: json["imageUrl"] as String,
    );
  }

  Map<String, Object> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "category" : category,
    "price": price,
    "imageUrl": imageUrl,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MenuModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              description == other.description &&
              price == other.price &&
              imageUrl == other.imageUrl &&
              category == other.category;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      category.hashCode;

  @override
  String toString() {
    return 'MenuModel{id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, category: $category}';
  }

}
