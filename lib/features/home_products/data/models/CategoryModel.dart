import 'package:we_shop/features/home_products/domain/entities/Category.dart';

class CategoryModel extends Category {
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  CategoryModel();
}
