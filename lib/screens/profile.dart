import 'package:flutter/material.dart';
import 'package:todo/models/user.dart';

class Profile extends StatelessWidget {
  final User user;
  const Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.fromLTRB(0, 100, 0, 100),
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                radius: 75,
              ),
              const SizedBox(height: 40),
              Text(
                user.username,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                user.name,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Text(
                user.email,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
