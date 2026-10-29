import 'product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  final int quantity;

  const CartItemEntity({required this.product, required this.quantity});

  double get totalPrice => (product.price ?? 0) * quantity;

  CartItemEntity copyWith({int? quantity}) {
    return CartItemEntity(product: product, quantity: quantity ?? this.quantity);
  }
}
