import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds the quantity picked before Add to Cart
class ProductDetailsCubit extends Cubit<int> {
  ProductDetailsCubit() : super(1);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 1) emit(state - 1);
  }
}
