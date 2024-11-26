part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<Product> products;
  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsState {
  final String title;
  ProductsFailureState(this.title);
}
