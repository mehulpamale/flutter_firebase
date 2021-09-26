import 'package:firebase_demo/models/user.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyUser? user = Provider.of<MyUser?>(context);
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
            // backgroundColor: Colors.white,
            title: Text('Home'),
            actions: [
              FlatButton.icon(
                textColor: Colors.white,
                onPressed: () async => await AuthService().signOut(),
                icon: Icon(Icons.logout),
                label: Text('Log Out'),
              ),
            ]),
        body: Center());
  }
}
