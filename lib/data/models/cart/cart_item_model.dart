import '../../entities/cart_item_entity.dart';
import '../product/product_model.dart';

class CartItemModel {
  final ProductModel product;
  final int quantity;

  const CartItemModel({required this.product, required this.quantity});

  factory CartItemModel.fromEntity(CartItemEntity item) {
    return CartItemModel(product: ProductModel.fromEntity(item.product), quantity: item.quantity);
  }

  CartItemEntity toEntity() {
    return CartItemEntity(product: product.toEntity(), quantity: quantity);
  }
}
