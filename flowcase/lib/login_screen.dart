// A login screen, harvested from 
// https://stackoverflow.com/questions/66613582/screen-not-updating-after-using-setstate-flutter

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

class AuthForm extends StatefulWidget {
  const AuthForm({required Key key}) : super(key: key);

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  var isLogIn = true;
  var _userEmail = '';
  var _userPass = '';
  var _userUsername = '';
  final _formKey = GlobalKey<FormState>();
  void _trySubmit() {
    final bool? isValid = _formKey.currentState?.validate();

    FocusScope.of(context).unfocus();

    if (isValid!) {
      _formKey.currentState?.save();

      debugPrint(_userEmail);
      debugPrint(_userPass);
      debugPrint(_userUsername);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!isLogIn)
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(labelText: "User Name"),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return "Please enter at least 4 charecters";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userUsername = value!;
                      },
                    ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return "Please enter at least 7 characters";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userPass = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _trySubmit,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        isLogIn ? "Log In" : "Sign Up",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogIn = !isLogIn;
                        if (kDebugMode) {
                          print(isLogIn);
                        }
                      });
                    },
                    child: Text(isLogIn
                        ? "Create New Account"
                        : "I already have an Account"),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
