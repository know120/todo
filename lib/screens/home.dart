import 'package:flutter/material.dart';
import 'package:todo/models/user.dart';
import 'package:todo/screens/profile.dart';
import 'package:todo/widgets/todo_layout.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> _body = [
    const TodoLayout(),
    const Icon(Icons.history),
    Profile(user: User('know120', 'Sujay Halder', 'email@gmail.com'))
  ];

  final List<String> _titles = ['To Do', 'History', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles.elementAt(currentIndex),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.teal,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: _body.elementAt(currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.amber,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
