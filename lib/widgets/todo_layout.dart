import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_card.dart';
import 'package:todo/widgets/todo_dialog.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({super.key});

  @override
  State<StatefulWidget> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  List<Todo> todoList = [
    // Todo('first', 'first todo'),
    // Todo('second', 'second todo'),
    // Todo('third', 'third todo'),
  ];

  Future<void> addDialog(Todo todo, String title) async {
    Todo? res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return TodoDialog(
            title: title,
            todo: todo,
            save: () {},
          );
        });
    if (res != null) {
      setState(() {
        if (todoList.contains(todo)) {
          todoList[todoList.indexOf(todo)] = res;
        } else {
          todoList.insert(0, res);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (content, index) {
          return TodoCard(
            todo: todoList[index],
            delete: () {
              setState(() {
                todoList.remove(todoList[index]);
              });
            },
            edit: () async {
              await addDialog(todoList[index], 'Edit');
            },
            done: () {
              setState(() {
                todoList[index].isDone = 1;
              });
            },
            undo: () {
              setState(() {
                todoList[index].isDone = 1;
              });
            },
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: todoList
      //         .map((todo) => TodoCard(
      //               todo: todo,
      //               delete: () {
      //                 setState(() {
      //                   todoList.remove(todo);
      //                 });
      //               },
      //               edit: () async {
      //                 await addDialog(todo, 'Edit');
      //               },
      //               complete: () {
      //                 setState(() {
      //                   todoList.remove(todo);
      //                 });
      //               },
      //             ))
      //         .toList(),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addDialog(Todo(-1, '', '', 0), 'Add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
