class AddToCartModel {
  final String id;
  final int quantity;
  final String? color;
  final String? size;

  AddToCartModel({
    required this.id,
    required this.quantity,
    this.color,
    this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': id,
      'quantity': quantity,
      if (color != null) 'color': color,
      if (size != null) 'size': size,
    };
  }
}
