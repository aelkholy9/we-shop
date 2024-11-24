import 'package:we_shop/features/home_products/data/models/CategoryModel.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';

class ProductModel extends Product {
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  ProductModel();
}
