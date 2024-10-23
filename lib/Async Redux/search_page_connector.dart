import 'package:firebase01/Async%20Redux/actions.dart';
import 'package:firebase01/Async%20Redux/app_state.dart';
import 'package:firebase01/Async%20Redux/increment.dart';
import 'package:firebase01/Async%20Redux/search_model.dart';
import 'package:firebase01/Async%20Redux/search_page.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

class SearchPageConnector extends StatelessWidget {
  const SearchPageConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchPageViewmodel>(
      vm: () => Factory(this),
      builder: (context, vm) => SearchPage(
        counter: vm.number,
        response: vm.response,
        onIncrement: vm.onIncrement,
        onDecrement: vm.onDecrement,
        getAllProducts: vm.productsResponse,
      ),
    );
  }
}

class Factory
    extends VmFactory<AppState, SearchPageConnector, SearchPageViewmodel> {
  Factory(connector) : super(connector);

  Future<void> _getProducts() async {
    try {
      dispatch(FetchProductsAction());
      print("Executing Async Task");
    } catch (error) {
      print("Error fetching products: $error");
    }
  }

  @override
  SearchPageViewmodel fromStore() => SearchPageViewmodel(
        number: state.number,
        response: state.productsResponse,
        onIncrement: () => dispatch(IncrementAction(number: 1)),
        onDecrement: () => dispatch(DecrementAction(number: 1)),
        productsResponse: () => _getProducts(),
      );
}
