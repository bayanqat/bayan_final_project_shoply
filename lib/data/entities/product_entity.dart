class ProductEntity {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  final String? categoryId;
  final double? rating;
  final int? reviewsCount;

  const ProductEntity({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.categoryId,
    this.rating,
    this.reviewsCount,
  });
}
