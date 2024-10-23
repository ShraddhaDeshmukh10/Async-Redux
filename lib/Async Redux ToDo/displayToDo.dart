import 'package:flutter/material.dart';

class DisplayPageToDo extends StatelessWidget {
  final List<String> todos;
  final void Function(String text) deleteItems;
  final void Function(String text) addItems;
  DisplayPageToDo(
      {super.key,
      required this.todos,
      required this.addItems,
      required this.deleteItems});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo HomePage"),
        backgroundColor: Colors.indigo.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 500,
                      child: TextField(
                        controller: controller,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        addItems(controller.text);
                        // store.dispatch(AddItemToList01(todo: controller.text));
                        controller.clear();
                      }
                    },
                    child: Icon(Icons.add))
              ],
            ),
            Expanded(
              child: Container(
                height: 500,
                width: 500,
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(todos[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteItems(todos[index]);
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
