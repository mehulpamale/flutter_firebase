import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/screens/authenticate/register.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/utils/widget_ext.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;

  const SignIn({Key? key, this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  var error = '';

  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign in'),
        actions: [
          FlatButton.icon(
              // color: Colors.white,
              //   focusColor: Colors.white,
              textColor: Colors.white,
              onPressed: () => widget.toggleView!(),
              icon: Icon(Icons.person),
              label: Text('Sign In'))
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Name'),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Password'),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        print('cred:$email, $password');
                        if (_formkey.currentState!.validate()) {
                          dynamic result =
                          await _auth.signIn(email, password);
                          if (result == null) {
                            setState(() => error = 'could not sign in with those credentials'
                                'or '
                                'password');
                          } else{
                            // showDialog(context: context, builder: builder)
                            // showDialog(context: context, 'success');

                          }
                        }
                      },
                      child: Text('Sign In')),
                  Text('or'),
                  ElevatedButton(
                    child: Text('Sign In Anonymously'),
                    onPressed: () async {
                      _auth
                          .signAnon()
                          .then((value) => print('v:$value'))
                          .onError((error, stackTrace) => print('$error'));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
