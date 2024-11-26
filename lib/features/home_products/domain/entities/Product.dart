import 'package:equatable/equatable.dart';

import 'Category.dart';

class Product extends Equatable {
  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  int? id;
  String? title;
  num? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  @override
  List<Object?> get props => [id];
}
