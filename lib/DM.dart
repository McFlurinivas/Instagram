import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/main.dart';
import 'package:insta_demo/Home.dart';

class dm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(
            "Cristine",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.keyboard_arrow_down),
        ]),
        centerTitle: true,
        actions: <Widget>[Icon(Icons.add), SizedBox(width: 10)],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 15),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    prefixIcon: Icon(Icons.search),
                    fillColor: Color(0xFFCBCBCB),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFFCBCBCB))),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dmss.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(dmss[index].url),
                      radius: 30,
                    ),
                    title: Text(
                      dmss[index].name,
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Icon(Icons.camera_alt_outlined),
                    subtitle: Row(
                      children: [
                        SizedBox(
                            width: 114,
                            child: Text(
                              'Hey! How are you? All Fine?',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            )),
                        SizedBox(width: 65),
                        Text('.Now')
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
              ),
              //SizedBox(width: 10)
            ),
          ],
        ),
      ),
    );
  }
}

class dms {
  final String name;
  final String url;

  dms(this.name, this.url);
}

List<story> dmss = [
  story("Godwin", "https://uifaces.co/our-content/donated/IPh6PTBx.jpg"),
  story("Ben", "https://uifaces.co/our-content/donated/KtCFjlD4.jpg"),
  story("Hari", "https://uifaces.co/our-content/donated/gPZwCbdS.jpg"),
  story("Wilson", "https://randomuser.me/api/portraits/men/36.jpg"),
  story("Patrick", "https://uifaces.co/our-content/donated/1H_7AxP0.jpg"),
  story("Muri", "https://randomuser.me/api/portraits/women/79.jpg"),
  story('Tan',
      "https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=3759e09a5b9fbe53088b23c615b6312e"),
  story("Nas", "https://randomuser.me/api/portraits/men/32.jpg"),
  story("Kapi", "https://uifaces.co/our-content/donated/vIqzOHXj.jpg"),
  story("Kyaan", "https://randomuser.me/api/portraits/women/44.jpg"),
  story("Tanmay", "https://randomuser.me/api/portraits/men/64.jpg")
];
