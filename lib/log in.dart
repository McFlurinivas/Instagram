import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/bottomnav.dart';
import 'package:insta_demo/main.dart';
import 'package:insta_demo/signup.dart';
import 'package:insta_demo/Home.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String? error;
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Instagram',
                              style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'Billabong',
                              )),
                          SizedBox(height: 50),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Email Cannot Be Blank'
                                  : null,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                              validator: (value) => value!.isEmpty
                                  ? 'Password Cannot Be Blank'
                                  : null,
                            ),
                          ),
                          SizedBox(height: 10),
                          if(error!=null)
                            Text(error!, style: TextStyle(color: Colors.red),)
                            ,
                          SizedBox(height: 15),
                          Row(children: [
                            Spacer(),
                            Container(
                              padding: EdgeInsets.fromLTRB(100, 0, 30, 0),
                              child: Text(
                                "Forgot Password?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ]),
                          SizedBox(height: 30),
                          FlatButton(
                              height: 50,
                              minWidth: 300,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    await _signInWithEmailAndPassword();

                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NavBottom()),
                                    );
                                  } catch (e) {
                                    setState(() {
                                      error = 'Wrong Email or Password';
                                    });
                                    print(e);
                                  }
                                }
                              },
                              child: Text('Log In',
                                  style: TextStyle(color: Colors.white)),
                              color: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10))),
                        ])),
                SizedBox(height: 30),

                Row(children: [
                  Expanded(child: Divider(indent: 20)),
                  Text("  OR  "),
                  Expanded(child: Divider(endIndent: 20))
                ]),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: Text(
                      "Don’t have an account? ",
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text("Sign up.",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ),
                  ),
                ]),
                //SizedBox(height: 30),

                /*Expanded(child: Divider()),
                  Text("Instagram от Facebook"),*/
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    final User? user = (await auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }
}
