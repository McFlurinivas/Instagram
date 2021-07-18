import 'package:flutter/material.dart';
import 'package:insta_demo/log in.dart';
import 'package:insta_demo/signup.dart';
import 'package:insta_demo/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: new AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Instagram', style: TextStyle(fontSize: 50, fontFamily: 'Billabong',)),
        SizedBox(height: 50),
        FlatButton(
            height: 50,
            minWidth: 300,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
            child: Text('Log In', style: TextStyle(color: Colors.white)),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.white, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10))),
        SizedBox(height: 70),
        FlatButton(
          height: 50,
          minWidth: 300,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signup()));
          },
          child: Text('Sign Up', style: TextStyle(color: Colors.lightBlue)),
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.lightBlue, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    )));
  }
}
