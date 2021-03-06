import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/Home.dart';
import 'package:insta_demo/search.dart';
import 'package:insta_demo/profile.dart';
import 'package:insta_demo/activity.dart';
import 'package:insta_demo/addPost.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({Key? key}) : super(key: key);

  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Widget? body;

    switch (curIndex) {
      case 0:
        body = home();
        break;

      case 1:
        body = Search();
        break;

      case 2:
        body = posts();
        break;

      case 3:
        body = activity();
        break;

      case 4:
      body= profile();
        break;

      default:
        body = null;
        break;
    }

    final auth = FirebaseAuth.instance;
    final firestoreInstance = FirebaseFirestore.instance;
    String _dp = '';
    Future<void> getDocument() async {
      var documentSnapshot = await firestoreInstance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .get();
      setState(() {
        _dp = documentSnapshot.get('profilepic');
      });
    }

    @override
    void initState() {
      super.initState();
      getDocument();
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIndex,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.black),

        onTap: (int index) => setState(() => curIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.heartOutline), label: ''),
          BottomNavigationBarItem(
              icon: InkWell(
                child: CircleAvatar(
                  backgroundImage: (_dp.isNotEmpty)?NetworkImage(_dp):null,
                  radius: 15,
                ),
              ),
              label: ''),
        ],
      ),
      body: body,
    );
  }
}
