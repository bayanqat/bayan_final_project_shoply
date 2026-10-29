import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    String? id,
    String? name,
    String? description,
    double? price,
    String? image,
    String? categoryId,
    double? rating,
    int? reviewsCount,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(ProductEntity product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      image: product.image,
      categoryId: product.categoryId,
      rating: product.rating,
      reviewsCount: product.reviewsCount,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      image: image,
      categoryId: categoryId,
      rating: rating,
      reviewsCount: reviewsCount,
    );
  }
}
