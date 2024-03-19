import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoDialog extends StatefulWidget {
  const TodoDialog(
      {super.key, required this.todo, required this.save, required this.title});
  final Todo todo;
  final Function save;
  final String title;

  @override
  State<TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  late final TextEditingController firstController =
      TextEditingController(text: widget.todo.title);

  late final TextEditingController secondController =
      TextEditingController(text: widget.todo.details);

  bool _disableSave = true;

  void checkValidTodo(String args) {
    if (firstController.text.isNotEmpty && secondController.text.isNotEmpty) {
      setState(() {
        _disableSave = false;
      });
    } else {
      setState(() {
        _disableSave = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(10.0),
      title: Center(child: Text(widget.title)),
      children: [
        TextFormField(
          controller: firstController,
          autofocus: true,
          onChanged: checkValidTodo,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Title',
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          minLines: 2,
          maxLines: 4,
          controller: secondController,
          onChanged: checkValidTodo,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Details',
          ),
        ),
        const SizedBox(height: 8.0),
        Align(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: [
              ElevatedButton.icon(
                onPressed: _disableSave
                    ? null
                    : () {
                        Navigator.pop(
                            context,
                            Todo(-1, firstController.text,
                                secondController.text, 0));
                      },
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll<Color>(Colors.green)),
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context, null);
                },
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll<Color>(Colors.red)),
                icon: const Icon(Icons.close),
                label: const Text('Close'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
