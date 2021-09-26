import 'package:firebase_demo/models/user.dart';
import 'package:firebase_demo/screens/authenticate/authenticate.dart';
import 'package:firebase_demo/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    // print(user.uid);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
