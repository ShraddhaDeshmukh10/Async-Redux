import 'package:async_redux/async_redux.dart';
import 'package:firebase01/Async%20redux01/app_state01.dart';

class CounterIncrement extends ReduxAction<AppState01> {
  int number;
  CounterIncrement({required this.number});

  @override
  AppState01 reduce() {
    return state.copy(number: state.number + number);
  }
}

////in actions.dart we can create what change we want, so here we have to create multiple class or function
///reducer is a part of it which creates new state
class CounterDecrement extends ReduxAction<AppState01> {
  int number;
  CounterDecrement({required this.number});
  @override
  AppState01 reduce() {
    return state.copy(number: state.number - number);
  }
}
