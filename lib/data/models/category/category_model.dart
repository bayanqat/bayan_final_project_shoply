import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({String? id, String? name, String? image}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, image: image);
  }
}
