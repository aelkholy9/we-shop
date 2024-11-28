part of 'most_use_products_bloc.dart';

@immutable
abstract class MostUseProductsState extends Equatable {
  final int currentPage;
  final List<Product> products;
  final bool? hasMorePages;
  const MostUseProductsState(this.currentPage, this.products,
      [this.hasMorePages = true]);
}

class MostUseProductsInitial extends MostUseProductsState {
  MostUseProductsInitial() : super(0, []);

  @override
  List<Object?> get props => [currentPage, products];
}

class MostUseProductsLoading extends MostUseProductsState {
  const MostUseProductsLoading(super.currentPage, super.products);

  @override
  List<Object?> get props => [currentPage, products];
}

class MostUseProductsSuccess extends MostUseProductsState {
  const MostUseProductsSuccess(
      super.currentPage, super.products, super.hasMorePages);

  @override
  List<Object?> get props => [currentPage, products, hasMorePages];
}

class MostUseProductsFailure extends MostUseProductsState {
  final String title;

  const MostUseProductsFailure(this.title, super.currentPage, super.products);

  @override
  List<Object?> get props => [currentPage, products, title];
}

class MoreMostUseProductsLoading extends MostUseProductsState {
  const MoreMostUseProductsLoading(
    super.currentPage,
    super.products,
  );

  @override
  List<Object?> get props => [currentPage, products, hasMorePages];
}
