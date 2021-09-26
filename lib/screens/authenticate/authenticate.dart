import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/screens/authenticate/register.dart';
import 'package:firebase_demo/screens/authenticate/sign_in.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;


  toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('authenticate');
    if (showSignIn) {
      return (SignIn(toggleView: toggleView));
    } else {
      return (Register(toggleView: toggleView));
    }
  }
}
