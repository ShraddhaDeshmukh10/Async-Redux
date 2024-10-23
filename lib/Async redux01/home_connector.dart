import 'package:async_redux/async_redux.dart';
import 'package:firebase01/Async%20redux01/app_state01.dart';
import 'package:firebase01/Async%20redux01/display%20file.dart';
import 'package:firebase01/Async%20redux01/app_actions01.dart';
import 'package:flutter/material.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState01, ViewModel>(
      ///here we are redirecting this to ViewModel with the help of StoreConnector ,which is part of  redux
      vm: () => Factory(this),
      builder: (context, vm) => MyHomePage(
        counter: vm.number,
        onIncrement: vm.onIncrement,
        onDecrement: vm.onDecrement,
      ),
    );
  }
}

class Factory extends VmFactory<AppState01, HomePageConnector, ViewModel> {
  Factory(HomePageConnector widget) : super(widget);

  @override
  ViewModel fromStore() => ViewModel(
        ///this also from redux from store
        number: state.number,
        onIncrement: () => dispatch(
            CounterIncrement(number: 1)), // Ensure action is dispatched here
        onDecrement: () => dispatch(CounterDecrement(number: 1)),
      );
}

class ViewModel extends Vm {
  //////take data
  final int number;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  ViewModel({
    required this.number,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(equals: [number]);

  ///super equals is important that is what renders the ui of the app
}
