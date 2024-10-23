import 'package:firebase01/Async%20Redux/response.dart';

class AppState {
  final int number;
  int ProductResponse = 10;
  final ProductsResponse productsResponse;

  AppState({
    required this.number,
    required this.productsResponse,
  });

  AppState copy({
    int? number,
    ProductsResponse? productsResponse,
  }) {
    return AppState(
        number: number ?? this.number,
        productsResponse: productsResponse ?? this.productsResponse);
  }

  static AppState initialState() =>
      AppState(number: 0, productsResponse: ProductsResponse.initialize());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          number == other.number &&
          productsResponse == other.productsResponse;
  @override
  int get hashCode => number.hashCode;
}
