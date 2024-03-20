import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final Function delete;
  final Function edit;
  final Function done;
  final Function undo;

  const TodoCard(
      {super.key,
      required this.todo,
      required this.delete,
      required this.edit,
      required this.done,
      required this.undo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              todo.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  decorationThickness: 3,
                  decoration: todo.isDone == 1
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            Text(
              todo.details,
              style: TextStyle(
                  decorationThickness: 2,
                  decoration: todo.isDone == 1
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Wrap(
                children: [
                  IconButton(
                    onPressed: () => delete(),
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    tooltip: 'Delete',
                  ),
                  IconButton(
                    onPressed: () => edit(),
                    icon: const Icon(Icons.edit),
                    color: Colors.grey[800],
                    tooltip: 'Edit',
                  ),
                  todo.isDone == 1
                      ? IconButton(
                          onPressed: () => undo(),
                          icon: const Icon(Icons.undo),
                          color: Colors.blue,
                          tooltip: 'Undo',
                        )
                      : IconButton(
                          onPressed: () => done(),
                          icon: const Icon(Icons.done),
                          color: Colors.green,
                          tooltip: 'Done',
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
    // TODO: use listtile inplace of card
  }
}
