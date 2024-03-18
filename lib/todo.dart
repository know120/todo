import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 6, 6, 14)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
