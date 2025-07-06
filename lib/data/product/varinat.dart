class Variant {
  final int id;
  final String color;
  final int quantity;
  final DateTime arrivalDate;

  Variant({
    required this.id,
    required this.color,
    required this.quantity,
    required this.arrivalDate,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json['id'] ?? 0,
      color: json['color'] ?? '',
      quantity: json['quantity'] ?? 0,
      arrivalDate: DateTime.parse(json['arrivalDate']),
    );
  }
}
