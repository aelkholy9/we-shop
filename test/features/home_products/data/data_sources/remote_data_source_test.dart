import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:we_shop/features/home_products/data/data_sources/remote/remote_product_data_source_impl.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/core/network/network_client.dart';
import 'package:we_shop/core/constants/api_constants.dart';
import 'package:we_shop/core/constants/constants.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([NetworkClient])
void main() {
  late MockNetworkClient mockNetworkClient;
  late ProductRemoteDataSourceImpl productRemoteDataSource;
  final mockedResponse = Response(requestOptions: RequestOptions(), data: [
    {
      "id": 16,
      "title": "Classic White Tee - Timeless Style and Comfort",
      "price": 73,
      "description":
          "Elevate your everyday wardrobe with our Classic White Tee. Crafted from premium soft cotton material, this versatile t-shirt combines comfort with durability, perfect for daily wear. Featuring a relaxed, unisex fit that flatters every body type, it's a staple piece for any casual ensemble. Easy to care for and machine washable, this white tee retains its shape and softness wash after wash. Pair it with your favorite jeans or layer it under a jacket for a smart look.",
      "images": [
        "https://i.imgur.com/Y54Bt8J.jpeg",
        "https://i.imgur.com/SZPDSgy.jpeg",
        "https://i.imgur.com/sJv4Xx0.jpeg"
      ],
      "creationAt": "2024-11-24T02:02:06.000Z",
      "updatedAt": "2024-11-24T02:02:06.000Z",
      "category": {
        "id": 1,
        "name": "asdfvgbhnj",
        "image": "https://i.imgur.com/QkIa5tT.jpeg",
        "creationAt": "2024-11-24T02:02:06.000Z",
        "updatedAt": "2024-11-24T10:39:43.000Z"
      }
    },
    {
      "id": 17,
      "title": "Classic Black T-Shirt",
      "price": 35,
      "description":
          "Elevate your everyday style with our Classic Black T-Shirt. This staple piece is crafted from soft, breathable cotton for all-day comfort. Its versatile design features a classic crew neck and short sleeves, making it perfect for layering or wearing on its own. Durable and easy to care for, it's sure to become a favorite in your wardrobe.",
      "images": [
        "https://i.imgur.com/9DqEOV5.jpeg",
        "https://i.imgur.com/ae0AEYn.jpeg",
        "https://i.imgur.com/mZ4rUjj.jpeg"
      ],
      "creationAt": "2024-11-24T02:02:06.000Z",
      "updatedAt": "2024-11-24T02:02:06.000Z",
      "category": {
        "id": 1,
        "name": "asdfvgbhnj",
        "image": "https://i.imgur.com/QkIa5tT.jpeg",
        "creationAt": "2024-11-24T02:02:06.000Z",
        "updatedAt": "2024-11-24T10:39:43.000Z"
      }
    },
  ]);
  setUp(() {
    mockNetworkClient = MockNetworkClient();
    productRemoteDataSource = ProductRemoteDataSourceImpl(mockNetworkClient);
  });

  group('ProductRemoteDataSourceImpl', () {
    test(
        'getMainProducts should return a list of products when the network call is successful',
        () async {
      when(mockNetworkClient.get(any)).thenAnswer(
        (_) async => mockedResponse,
      );

      final result = await productRemoteDataSource.getMainProducts();

      expect(result, isA<List<Product>>());
      expect(result.length, 2);
      expect(result[0].id, 16);
      expect(result[1].id, 17);
      verify(mockNetworkClient.get(any)).called(1);
    });

    test(
        'getMostUsedProducts should return a list of products with offset parameter',
        () async {
      const offset = 10;
      when(mockNetworkClient.get(any)).thenAnswer(
        (_) async => mockedResponse,
      );

      final result = await productRemoteDataSource.getMostUsedProducts(offset);

      expect(result, isA<List<Product>>());
      expect(result.length, 2);
      expect(result[0].id, 16);
      verify(mockNetworkClient.get(
              '${ApiConstants.productsPrefix}?${Constants.limit}=${Constants.defaultPaginationLimit}&${Constants.offset}=$offset'))
          .called(1);
    });

    test(
        'getRecommendedProducts should return a list of products with offset 0',
        () async {
      when(mockNetworkClient.get(any)).thenAnswer(
        (_) async => mockedResponse,
      );

      final result = await productRemoteDataSource.getRecommendedProducts();

      expect(result, isA<List<Product>>());
      expect(result.length, 2);
      expect(result[0].id, 16);
      verify(mockNetworkClient.get(
              '${ApiConstants.productsPrefix}?${Constants.limit}=${Constants.defaultPaginationLimit}&${Constants.offset}=0'))
          .called(1);
    });

    test(
        'getMainProducts should throw an exception when the network call fails',
        () async {
      when(mockNetworkClient.get(any))
          .thenThrow(Exception('Failed to load products'));

      expect(() async => await productRemoteDataSource.getMainProducts(),
          throwsException);
      verify(mockNetworkClient.get(any)).called(1);
    });
  });
}

class MockNetworkResponse {
  final List data;

  MockNetworkResponse({required this.data});
}
