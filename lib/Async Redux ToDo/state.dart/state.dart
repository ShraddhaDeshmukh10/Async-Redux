class AppStateToDo {
  final List<String> todos;
  AppStateToDo({required this.todos});

  AppStateToDo copy({List<String>? todos}) {
    return AppStateToDo(todos: todos ?? this.todos);
  }

  static AppStateToDo initialState() => AppStateToDo(todos: []);
}
