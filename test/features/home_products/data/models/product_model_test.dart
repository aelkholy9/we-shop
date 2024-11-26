import 'package:test/test.dart';
import 'package:we_shop/features/home_products/data/models/ProductModel.dart';

void main() {
  group('test ProductModel serialization function', () {
    test('should parse JSON correctly and initialize the product model', () {
      final Map<String, dynamic> json = {
        "id": 1,
        "title": "Classic White Crew Neck T-Shirt",
        "price": 100.0,
        "description": "this t-shirt is a must-have staple for every wardrobe.",
        "images": ["https://i.imgur.com/Y54Bt8J.jpeg"],
        "creationAt": "2024-11-24T02:02:06.000Z",
        "updatedAt": "2024-11-24T17:47:07.000Z",
        "category": {
          "id": 1,
          "name": "asdfvgbhnj",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2024-11-24T02:02:06.000Z",
          "updatedAt": "2024-11-24T10:39:43.000Z"
        }
      };

      final product = ProductModel.fromJson(json);

      expect(product.id, 1);
      expect(product.title, 'Classic White Crew Neck T-Shirt');
      expect(product.price, 100.0);
      expect(product.description,
          'this t-shirt is a must-have staple for every wardrobe.');
      expect(product.images, ["https://i.imgur.com/Y54Bt8J.jpeg"]);
      expect(product.creationAt, '2024-11-24T02:02:06.000Z');
      expect(product.category?.id, 1);
      expect(product.category?.name, 'asdfvgbhnj');
    });

    test('should handle category being null', () {
      final Map<String, dynamic> json = {
        "id": 1,
        "title": "Classic White Crew Neck T-Shirt",
        "price": 100.0,
        "description": "this t-shirt is a must-have staple for every wardrobe.",
        "images": ["https://i.imgur.com/Y54Bt8J.jpeg"],
        "creationAt": "2024-11-24T02:02:06.000Z",
        "updatedAt": "2024-11-24T17:47:07.000Z",
      };

      final product = ProductModel.fromJson(json);

      expect(product.id, 1);
      expect(product.title, 'Classic White Crew Neck T-Shirt');
      expect(product.price, 100.0);
      expect(product.description,
          'this t-shirt is a must-have staple for every wardrobe.');
      expect(product.images, ["https://i.imgur.com/Y54Bt8J.jpeg"]);
      expect(product.creationAt, '2024-11-24T02:02:06.000Z');
      expect(product.category, isNull);
    });
  });

  test('should handle int price', () {
    final Map<String, dynamic> json = {
      "id": 1,
      "title": "Classic White Crew Neck T-Shirt",
      "price": 50,
      "description": "this t-shirt is a must-have staple for every wardrobe.",
      "images": ["[\"https://i.imgur.com/axsyGpD.jpeg\"]"],
      "creationAt": "2024-11-24T02:02:06.000Z",
      "updatedAt": "2024-11-24T17:47:07.000Z",
    };

    final product = ProductModel.fromJson(json);

    expect(product.price, isA<int>());
    expect(product.price, 50);
  });

  test('should handle double price', () {
    final Map<String, dynamic> json = {
      "id": 1,
      "title": "Classic White Crew Neck T-Shirt",
      "price": 50.5,
      "description": "this t-shirt is a must-have staple for every wardrobe.",
      "images": ["[\"https://i.imgur.com/axsyGpD.jpeg\"]"],
      "creationAt": "2024-11-24T02:02:06.000Z",
      "updatedAt": "2024-11-24T17:47:07.000Z",
    };

    final product = ProductModel.fromJson(json);

    expect(product.price, isA<double>());
    expect(product.price, 50.5);
  });
}
