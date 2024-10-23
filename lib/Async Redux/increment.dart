import 'package:firebase01/Async%20Redux/app_state.dart';
import 'package:async_redux/async_redux.dart';

class DecrementAction extends ReduxAction<AppState> {
  final int number;

  DecrementAction({required this.number});
  @override
  AppState reduce() {
    return state.copy(
        number: state.number <= 0 ? state.number : state.number - number);
  }

  @override
  void after() {
    // TODO: implement after
    super.after();
  }

  @override
  before() {
    // TODO: implement before
    return super.before();
  }
}