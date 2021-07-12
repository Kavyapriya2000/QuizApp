import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/widget/widget.dart';
import 'package:quiz_app/helper/constants.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;

  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  bool userNotFound = false, passwordWrong = false, validEmail;
  String email = '', password = '', name = "";

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  getInfoAndSignIn() async {
    if (_formKey.currentState.validate()) {
      Constants.isUserLoggedIn().then((value) {
        String errorMsg = '';
        if (value) {
          Constants.getUserData().then((value) {
            if (value.email != email) {
              errorMsg = "User details not exist. Please sign up...";
            } else if (value.password != password) {
              errorMsg = "Invalid password";
            } else {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }
          });
        } else {
          errorMsg = "User details not exist. Please sign up...";
        }

        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(content: Text(errorMsg), actions: <Widget>[
                  TextButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Spacer(),
            Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          validateEmail(email) ? null : "Enter valid email",
                      decoration: InputDecoration(hintText: "Email"),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => (val != null && val.length < 6)
                          ? "Password must be more than 6 characters"
                          : null,
                      decoration: InputDecoration(hintText: "Password"),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        getInfoAndSignIn();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 17)),
                        GestureDetector(
                          onTap: () {
                            widget.toogleView();
                          },
                          child: Container(
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.black87,
                                    decoration: TextDecoration.underline,
                                    fontSize: 17)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}

bool validateEmail(String value) {
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return (!regex.hasMatch(value)) ? false : true;
}
