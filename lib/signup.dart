import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/bottomnav.dart';
import 'package:insta_demo/main.dart';
import 'package:insta_demo/log in.dart';
import 'package:insta_demo/Home.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Instagram', style: TextStyle(fontSize: 50, fontFamily: 'Billabong')),
                SizedBox(height: 50),
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                    ),
                  ),
                ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavBottom()),
                      );
                    },
                    child:
                        Text('Sign Up', style: TextStyle(color: Colors.white)),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10))),
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
                        Navigator.push(context,
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
}
