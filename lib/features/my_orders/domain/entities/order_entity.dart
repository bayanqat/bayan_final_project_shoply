class OrderEntity {
  final String? id;
  final int? orderNumber;
  final String? status;
  final List<OrderItemEntity> items;
  final int? itemsCount;
  final double? totalPrice;
  final DateTime? createdAt;

  const OrderEntity({
    this.id,
    this.orderNumber,
    this.status,
    this.items = const [],
    this.itemsCount,
    this.totalPrice,
    this.createdAt,
  });

  /// pending and approved orders are still active
  bool get isCompleted => status == 'delivered';
}

class OrderItemEntity {
  final String? productId;
  final String? name;
  final String? image;
  final double? price;
  final int? quantity;

  const OrderItemEntity({this.productId, this.name, this.image, this.price, this.quantity});
}
