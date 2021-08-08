import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/bottomnav.dart';
import 'package:insta_demo/log in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  String? error;

  final firestoreInstance = FirebaseFirestore.instance;
  Future<void> getDocument() async {
    var documentSnapshot = await firestoreInstance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    setState(() {
      _username.text = documentSnapshot.get('username');
      _email.text = documentSnapshot.get('email');
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }


  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,
      automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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
                                  fontSize: 50, fontFamily: 'Billabong')),
                          SizedBox(height: 50),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Username',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return 'Username Cannot Be Blank';
                                  else
                                    return null;
                                }),
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
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              obscureText: true,
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Confirm Password Cannot Be Blank';
                                else if (value != _passwordController.text)
                                  return 'Not Matching with Password';
                                else if (value.length < 8)
                                  return "Password must be atleast 8 characters long";
                                else
                                  return null;
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email ID',
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return 'Email Cannot Be Blank';
                                else
                                  return null;
                              }
                            ),
                          ),
                          SizedBox(height: 10),
                          if (error != null)
                            Text(
                              error!,
                              style: TextStyle(color: Colors.red),
                            ),
                          SizedBox(height: 30),
                          FlatButton(
                              height: 50,
                              minWidth: 300,
                              onPressed: () async {
                                try {
                                  if (_formKey.currentState!.validate()) {
                                    await _register();

                                    await firestoreInstance
                                        .collection("users")
                                        .doc(auth.currentUser!.uid)
                                        .set({
                                      "username": _usernameController.text,
                                      "email": _emailController.text,
                                      "bio": "",

                                      'profilepic': 'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                                    });

                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NavBottom()),
                                    );
                                  }
                                } catch (e) {
                                  setState(() {
                                    error = 'Email or Username already in Use';
                                  });
                                  print(e);
                                }
                              },
                              child: Text('Sign Up',
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
                      "Have an account?",
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => login()));
                      },
                      child: Text("Log in.",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                    ),
                  ),
                ]),
                //SizedBox(height: 30),

                //Expanded(child: Divider()),
                //Text("Instagram от Facebook"),
              ]),
        ),
      ),
    );
  }

  Future<void> _register() async {
    final User? user = (await auth.createUserWithEmailAndPassword(
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
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
