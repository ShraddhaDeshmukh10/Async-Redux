class ProductsResponse {
  final List<String> products;

  ProductsResponse({required this.products});

  factory ProductsResponse.initialize() {
    return ProductsResponse(products: []);
  }
}
