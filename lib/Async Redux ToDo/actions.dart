import 'package:async_redux/async_redux.dart';
import 'package:firebase01/Async%20Redux%20ToDo/state.dart/state.dart';

class AddItemToList01 extends ReduxAction<AppStateToDo> {
  final String todo;
  AddItemToList01({required this.todo});

  @override
  AppStateToDo reduce() {
    ///creating new list as it is immutable,
    List<String> newlist = List.from(state.todos)..add(todo);
    // List<String> newlist = [];
    // newlist.addAll(state.todos);
    // newlist.add(todo);
    return state.copy(todos: newlist);
  }
}

class DeleteFromList extends ReduxAction<AppStateToDo> {
  final String todo;
  DeleteFromList({required this.todo});

  @override
  AppStateToDo reduce() {
    List<String> newlist = List.from(state.todos)..remove(todo);
    return state.copy(todos: newlist);
  }
}
