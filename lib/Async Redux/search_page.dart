import 'package:firebase01/Async%20Redux/response.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final int counter;
  final ProductsResponse response;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final Future Function() getAllProducts;

  const SearchPage({
    Key? key,
    required this.counter,
    required this.response,
    required this.onIncrement,
    required this.onDecrement,
    required this.getAllProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
          onPressed: onIncrement,
          child: const Text('Increment'),
        ),
        ElevatedButton(
          onPressed: onDecrement,
          child: const Text('Decrement'),
        ),
        ElevatedButton(
          onPressed: () async {
            await getAllProducts();
            // Handle the response if needed
          },
          child: const Text('Fetch Products'),
        ),
        // Display products if available
        if (response.products.isNotEmpty)
          ...response.products.map((product) => Text(product)).toList(),
      ],
    );
  }
}
