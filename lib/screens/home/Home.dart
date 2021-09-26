import 'package:firebase_demo/services/auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          TextButton.icon(
              onPressed: () => AuthService().signOut(),
              icon: Icon(Icons.person),
              label: Text(''))
        ]),
        body: Center(child: Text('home')));
  }
}

