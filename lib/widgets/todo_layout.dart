import 'package:flutter/material.dart';
import 'package:todo/db/db.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_card.dart';
import 'package:todo/widgets/todo_dialog.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({super.key});

  @override
  State<StatefulWidget> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  late DataBase dbHandler;
  List<Todo> todoList = [];

  @override
  initState() {
    super.initState();
    dbHandler = DataBase();
    dbHandler.getTodo().then((value) => {
          setState(() {
            todoList.addAll(value);
          })
        });
  }

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
      if (todoList.contains(todo)) {
        dbHandler.updateTodo(res).then((value) => {
              setState(() {
                res.id = value;
                todoList[todoList.indexOf(todo)] = res;
              })
            });
      } else {
        dbHandler.insertTodo(res).then((value) => {
              setState(() {
                res.id = value;
                todoList.insert(0, res);
              })
            });
      }
      // setState(() {
      //   if (todoList.contains(todo)) {
      //     todoList[todoList.indexOf(todo)] = res;
      //     dbHandler.insertTodo(res);
      //   } else {
      //     dbHandler.insertTodo(res).then((value) => {print('id is $value')});
      //     todoList.insert(0, res);
      //   }
      // });
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
              dbHandler.deleteTodo(todoList[index].id).then((value) => {
                    setState(() {
                      todoList.removeAt(index);
                    })
                  });
              // setState(() {
              //   dbHandler.deleteTodo(todoList[index].id);
              //   todoList.remove(todoList[index]);
              // });
            },
            edit: () async {
              await addDialog(todoList[index], 'Edit');
            },
            done: () {
              var todo = todoList.removeAt(index);
              todo.isDone = 1;
              dbHandler.updateTodo(todo).then((value) => {
                    setState(() {
                      todoList.add(todo);
                    })
                  });
              // setState(() {
              //   var todo = todoList.removeAt(index);
              //   todo.isDone = 1;
              //   todoList.add(todo);
              // });
            },
            undo: () {
              var todo = todoList.removeAt(index);
              todo.isDone = -1;
              dbHandler.updateTodo(todo).then((value) => {
                    setState(() {
                      todoList.insert(0, todo);
                    })
                  });
              // setState(() {
              //   var todo = todoList.removeAt(index);
              //   todo.isDone = -1;
              //   todoList.insert(0, todo);
              // });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addDialog(Todo(-1, '', '', 0), 'Add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
