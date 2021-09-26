import 'package:firebase_demo/screens/authenticate/sign_in.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/utils/widget_ext.dart';
import 'package:firebase_demo/utils/operator_ext.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function? toggleView;

  const Register({Key? key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  var error = '';

  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'enter en email' : null,
                    decoration: InputDecoration(hintText: 'Enter Name'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => val!.length < 6
                        ? 'length should be '
                            'at least 6 characters'
                        : null,
                    decoration: InputDecoration(hintText: 'Enter Password'),
                    obscureText: true,
                    onChanged: (val) => setState(() => password = val),
                  ),
                  SizedBox(height: 20),
                  Text(error,
                      style: TextStyle(color: Colors.red, fontSize: 14)),
                  ElevatedButton(
                      onPressed: () async {
                        print('cred:$email, $password');
                        if (_formkey.currentState!.validate()) {
                          dynamic result =
                              await _auth.register(email, password);
                          if (result == null) {
                            setState(() => error = 'please enter valid email '
                                'or '
                                'password');
                          } else {
                            // showDialog(context: context, builder: builder)
                            // showDialog(context: context, 'success');

                          }
                        }
                      },
                      child: Text('Register')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
