import 'package:flutter/material.dart';
import 'package:todo/models/user.dart';

class Profile extends StatelessWidget {
  final User user;
  Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 100, 0, 100),
        elevation: 15,
        child: Padding(
          padding: EdgeInsets.all(90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                radius: 75,
              ),
              SizedBox(height: 40),
              Text(
                user.username,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                user.name,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 10),
              Text(
                user.email,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
