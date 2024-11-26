import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_product_list_use_case.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductListUseCase getMainProductsUseCase;

  ProductsBloc(this.getMainProductsUseCase) : super(ProductsInitialState()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        await _getMainProducts(emit);
      }
    });
  }

  Future<void> _getMainProducts(Emitter<ProductsState> emit) async {
    final productsResult = await getMainProductsUseCase.execute();
    productsResult.fold(
      (l) => emit(ProductsFailureState(l.title)),
      (r) => emit(ProductsSuccessState(r)),
    );
  }
}
