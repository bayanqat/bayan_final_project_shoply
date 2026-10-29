import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/converters/timestamp_converter.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    String? id,
    int? orderNumber,
    String? userId,
    String? status,
    List<OrderItemModel>? items,
    int? itemsCount,
    double? totalPrice,
    @TimestampConverter() DateTime? createdAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      orderNumber: orderNumber,
      status: status,
      items: items?.map((item) => item.toEntity()).toList() ?? [],
      itemsCount: itemsCount,
      totalPrice: totalPrice,
      createdAt: createdAt,
    );
  }
}

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const OrderItemModel._();

  const factory OrderItemModel({
    String? productId,
    String? name,
    String? image,
    double? price,
    int? quantity,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

  OrderItemEntity toEntity() {
    return OrderItemEntity(
      productId: productId,
      name: name,
      image: image,
      price: price,
      quantity: quantity,
    );
  }
}
