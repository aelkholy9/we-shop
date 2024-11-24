part of 'main_products_bloc.dart';

@immutable
abstract class MainProductsState {}

class MainProductsInitial extends MainProductsState {}

class MainProductsLoading extends MainProductsState {}

class MainProductsSuccess extends MainProductsState {
  final List<Product> products;
  MainProductsSuccess(this.products);
}

class MainProductsFailure extends MainProductsState {
  final String title;
  MainProductsFailure(this.title);
}
