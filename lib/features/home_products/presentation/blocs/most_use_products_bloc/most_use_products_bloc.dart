import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:we_shop/features/home_products/domain/entities/Product.dart';
import 'package:we_shop/features/home_products/domain/use_cases/get_single_products_list/get_most_used_products_use_case.dart';

part 'most_use_products_event.dart';
part 'most_use_products_state.dart';

class MostUseProductsBloc
    extends Bloc<MostUseProductsEvent, MostUseProductsState> {
  final GetMostUsedProductsUseCase getMostUsedProductsUseCase;

  MostUseProductsBloc(this.getMostUsedProductsUseCase)
      : super(MostUseProductsInitial()) {
    on<MostUseProductsEvent>((event, emit) async {
      if (event is GetMostUseProductsEvent) {
        await _getMostUseProducts(emit);
      } else if (event is GetMoreMostUseProductsEvent) {
        await _getMoreProducts(emit);
      }
    });
  }

  Future<void> _getMostUseProducts(Emitter<MostUseProductsState> emit) async {
    emit(const MostUseProductsLoading(0, []));
    final productsResult = await getMostUsedProductsUseCase.execute();
    productsResult.fold(
      (l) => emit(MostUseProductsFailure(l.title, 0, state.products)),
      (r) => emit(MostUseProductsSuccess(0, r)),
    );
  }

  Future<void> _getMoreProducts(Emitter<MostUseProductsState> emit) async {
    emit(MoreMostUseProductsLoading(state.currentPage + 1, state.products));
    final productsResult =
        await getMostUsedProductsUseCase.execute(state.currentPage);
    productsResult.fold(
      (l) => emit(MostUseProductsFailure(
          l.title, state.currentPage - 1, state.products)),
      (r) => emit(
        MostUseProductsSuccess(
          state.currentPage,
          [
            ...state.products,
            ...r,
          ],
        ),
      ),
    );
  }
}
