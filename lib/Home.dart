import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/DM.dart';
import 'package:insta_demo/postDisplay.dart';
import 'package:video_player/video_player.dart';

class home extends StatelessWidget {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(EvaIcons.camera),
        title: Center(
            child: Text('Instagram',
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Billabong',
                    color: Colors.black))),
        actions: [
          Icon(EvaIcons.tvOutline),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(EvaIcons.paperPlaneOutline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dm()),
              );
            },
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Stories
            Container(
              height: 95,
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Column(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(stories[index].url)),
                        Text(
                          stories[index].name,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(width: 10)
                  ]);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),

            Divider(height: 0),
            post(),
          ],
        ),
      ),
    );
  }
}

class story {
  final String name;
  final String url;

  story(this.name, this.url);
}

List<story> stories = [
  story("Your Story", "https://uifaces.co/our-content/donated/3799Ffxy.jpeg"),
  story("Ben", "https://uifaces.co/our-content/donated/KtCFjlD4.jpg"),
  story("Hari", "https://uifaces.co/our-content/donated/gPZwCbdS.jpg"),
  story("Wilson", "https://randomuser.me/api/portraits/men/36.jpg"),
  story("Patrick", "https://uifaces.co/our-content/donated/1H_7AxP0.jpg"),
  story("Muri", "https://randomuser.me/api/portraits/women/79.jpg"),
  story('Tan',
      "https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=3759e09a5b9fbe53088b23c615b6312e"),
  story("Nas", "https://randomuser.me/api/portraits/men/32.jpg"),
  story("Kapi", "https://uifaces.co/our-content/donated/vIqzOHXj.jpg"),
  story("Kyaan", "https://randomuser.me/api/portraits/women/44.jpg")
];

class post extends StatefulWidget {
  const post({Key? key}) : super(key: key);

  @override
  _postState createState() => _postState();
}

class _postState extends State<post> {
  final firestoreInstance = FirebaseFirestore.instance;
  VideoPlayerController? controller;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreInstance.collection('post').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int i;
          int index = snapshot.data!.docs.length;
          List<Widget> children = [];
          for (i = 0; i < index; i++) {
            DocumentSnapshot ds = snapshot.data!.docs[i];
            Widget child = postDisplay(documentsnapshot: ds);
            children.add(child);
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

