import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_main_products_use_case.dart';

part 'main_products_event.dart';
part 'main_products_state.dart';

class MainProductsBloc extends Bloc<MainProductsEvent, MainProductsState> {
  final GetMainProductsUseCase getMainProductsUseCase;

  MainProductsBloc(this.getMainProductsUseCase) : super(MainProductsInitial()) {
    on<MainProductsEvent>((event, emit) async {
      if (event is GetMainProductsEvent) {
        await _getMainProducts(emit);
      }
    });
  }

  Future<void> _getMainProducts(Emitter<MainProductsState> emit) async {
    final productsResult = await getMainProductsUseCase.execute();
    productsResult.fold(
      (l) => emit(MainProductsFailure(l.title)),
      (r) => emit(MainProductsSuccess(r)),
    );
  }
}
