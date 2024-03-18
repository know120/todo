import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoDialog extends StatelessWidget {
  TodoDialog(
      {super.key, required this.todo, required this.save, required this.title});
  final Todo todo;
  final Function save;
  final String title;
  late final TextEditingController firstController =
      TextEditingController(text: todo.title);
  late final TextEditingController secondController =
      TextEditingController(text: todo.details);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(10.0),
      title: Center(child: Text(title)),
      children: [
        TextFormField(
          controller: firstController,
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Title',
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: secondController,
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
                onPressed: () {
                  Navigator.pop(context,
                      Todo(-1, firstController.text, secondController.text, 0));
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
