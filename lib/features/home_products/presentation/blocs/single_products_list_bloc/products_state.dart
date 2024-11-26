part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {}

class ProductsInitialState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsSuccessState extends ProductsState {
  final List<Product> products;
  ProductsSuccessState(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsFailureState extends ProductsState {
  final String title;
  ProductsFailureState(this.title);

  @override
  List<Object?> get props => [title];
}
