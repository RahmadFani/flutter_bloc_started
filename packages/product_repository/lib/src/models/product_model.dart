class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity = 0,
    this.imageUrl,
  });

  String? id;
  String? name;
  String? description;
  double? price;
  int quantity;
  String? imageUrl;

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        quantity = json['quantity'] ?? 0,
        imageUrl = json['imageUrl'];

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  bool get readyStock => quantity > 0;

  bool get isDataEmpty => id == null;
}
