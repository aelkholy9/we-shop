part of 'most_use_products_bloc.dart';

@immutable
abstract class MostUseProductsState {
  final int currentPage;
  final List<Product> products;

  const MostUseProductsState(this.currentPage, this.products);
}

class MostUseProductsInitial extends MostUseProductsState {
  MostUseProductsInitial() : super(0, []);
}

class MostUseProductsLoading extends MostUseProductsState {
  const MostUseProductsLoading(super.currentPage, super.products);
}

class MostUseProductsSuccess extends MostUseProductsState {
  const MostUseProductsSuccess(super.currentPage, super.products);
}

class MostUseProductsFailure extends MostUseProductsState {
  final String title;

  const MostUseProductsFailure(this.title, super.currentPage, super.products);
}

class MoreMostUseProductsLoading extends MostUseProductsState {
  const MoreMostUseProductsLoading(super.currentPage, super.products);
}
