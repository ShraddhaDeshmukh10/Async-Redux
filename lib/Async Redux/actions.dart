import 'package:async_redux/async_redux.dart';
import 'package:firebase01/Async%20Redux/response.dart';

import 'app_state.dart';

class IncrementAction extends ReduxAction<AppState> {
  final int number;

  IncrementAction({required this.number});

  @override
  AppState reduce() {
    return state.copy(number: state.number + number);
  }
}

class FetchProductsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    // Implement fetching products logic here
    return state.copy(
        productsResponse:
            ProductsResponse(products: ["Product 1", "Product 2", "3", "4"]));
  }
}
