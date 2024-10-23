import 'package:async_redux/async_redux.dart';
import 'package:firebase01/Async%20Redux%20ToDo/actions.dart';
import 'package:firebase01/Async%20Redux%20ToDo/displayToDo.dart';
import 'package:firebase01/Async%20Redux%20ToDo/state.dart/state.dart';
import 'package:flutter/material.dart';

class ToDoConnector extends StatelessWidget {
  const ToDoConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppStateToDo, ViewModelToDo>(
        vm: () => Factory(this),
        builder: (context, vm) => DisplayPageToDo(
            todos: vm.todos,
            deleteItems: (text) => vm.deleteItems(text),
            addItems: (text) => vm.addItems(text)));
  }
}

class Factory extends VmFactory<AppStateToDo, ToDoConnector, ViewModelToDo> {
  Factory(ToDoConnector widget) : super(widget);

  @override
  fromStore() {
    return ViewModelToDo(
      todos: state.todos,
      deleteItems: (text) => dispatch(DeleteFromList(todo: text)),
      addItems: (text) => dispatch(AddItemToList01(todo: text)),
    );
  }
}

class ViewModelToDo extends Vm {
  final List<String> todos;
  final void Function(String text) addItems;
  final void Function(String text) deleteItems;

  ViewModelToDo(
      {required this.addItems, required this.todos, required this.deleteItems})
      : super(equals: [todos]);
}
