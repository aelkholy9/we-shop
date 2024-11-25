part of 'most_use_products_bloc.dart';

@immutable
abstract class MostUseProductsEvent {}

class GetMostUseProductsEvent extends MostUseProductsEvent {}

class GetMoreMostUseProductsEvent extends MostUseProductsEvent {
  GetMoreMostUseProductsEvent();
}
