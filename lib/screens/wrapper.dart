import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/models/user.dart';
import 'package:firebase_demo/screens/authenticate/authenticate.dart';
import 'package:firebase_demo/screens/home/Home.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    print(user.uid);
    if (user.uid == '-1') {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
