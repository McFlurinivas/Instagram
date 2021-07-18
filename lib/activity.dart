import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:insta_demo/main.dart';
import 'package:insta_demo/bottomnav.dart';

class activity extends StatefulWidget {
  const activity({Key? key}) : super(key: key);

  @override
  _activityState createState() => _activityState();
}

class _activityState extends State<activity> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final Widget? body;

    switch (index) {
      case 0:
        body = following();
        break;

      case 1:
        body = you();
        break;

      default:
        body = null;
        break;
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(
                  text: 'Following',
                ),
                Tab(
                  text: 'You',
                ),
              ],
              onTap: (index) => setState(() => this.index = index),
            )),
        body: body,
      ),
    );
  }
}

class you extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Follow Requests',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.5)),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://uifaces.co/our-content/donated/vIqzOHXj.jpg'),
                  radius: 20,
                ),
                trailing: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network(
                    'https://miro.medium.com/max/1200/0*s7vGN34hz5jJUYTm.png',
                  ),
                ),
                title: Row(
                  children: [
                    SizedBox(
                        width: 132,
                        child: Text(
                          'kiero_d and 26 others liked your photo.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        )),
                    Text(
                      'Now',
                      style: (TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This Week',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/79.jpg'),
                      radius: 20,
                    ),
                    trailing: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.network(
                        'https://images2.minutemediacdn.com/image/upload/c_crop,h_726,w_1292,x_199,y_0/f_auto,q_auto,w_1100/v1578352479/shape/mentalfloss/62455-shout-factory1.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: SizedBox(
                        height: 60,
                        width: 145,
                        child: Text.rich(TextSpan(
                            text:
                            'Muri mentioned you in a comment: @Cristine ur fav',
                            children: [
                              TextSpan(
                                  text: ' 1d',
                                  style: TextStyle(color: Colors.grey))
                            ]))),
                    subtitle: Row(
                      children: [
                        Icon(EvaIcons.heartOutline, size: 15, color: Colors.grey,),
                        SizedBox(width: 15,),
                        Text('Reply', style: TextStyle(fontSize: 15, color: Colors.grey))
                      ]
                    ),
                    ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/32.jpg'),
                radius: 20,
              ),
              trailing: FlatButton(
                  onPressed: () {},
                  child:
                  Text('Follow', style: TextStyle(color: Colors.white)),
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5))),
              title: SizedBox(
                  height: 50,
                  width: 145,
                  child: Text.rich(TextSpan(
                      text: 'martini_rond started following you.',
                      children: [
                        TextSpan(
                            text: ' 3d', style: TextStyle(color: Colors.grey))
                      ]))),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/79.jpg'),
                radius: 20,
              ),
              trailing: FlatButton(
                  onPressed: () {},
                  child:
                  Text('Follow', style: TextStyle(color: Colors.white)),
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5))),
              title: SizedBox(
                  height: 50,
                  width: 145,
                  child: Text.rich(TextSpan(
                      text: 'Muri started following you.',
                      children: [
                        TextSpan(
                            text: ' 4d', style: TextStyle(color: Colors.grey))
                      ]))),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://uifaces.co/our-content/donated/gPZwCbdS.jpg'),
                radius: 20,
              ),
              trailing: FlatButton(
                  onPressed: () {},
                  child:
                  Text('Message', style: TextStyle(color: Colors.black)),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5))),
              title: SizedBox(
                  height: 50,
                  width: 145,
                  child: Text.rich(TextSpan(
                      text: 'Hari started following you.',
                      children: [
                        TextSpan(
                            text: ' 4d', style: TextStyle(color: Colors.grey))
                      ]))),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://uifaces.co/our-content/donated/1H_7AxP0.jpg'),
                radius: 20,
              ),
              trailing: FlatButton(
                  onPressed: () {},
                  child:
                  Text('Message', style: TextStyle(color: Colors.black)),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5))),
              title: SizedBox(
                  height: 50,
                  width: 145,
                  child: Text.rich(TextSpan(
                      text: 'Patrick started following you.',
                      children: [
                        TextSpan(
                            text: ' 4d', style: TextStyle(color: Colors.grey))
                      ]))),
            ),
          ]),
    ),
    Divider(),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    'This Month',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
    ListTile(
    leading: CircleAvatar(
    backgroundImage: NetworkImage(
    'https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=3759e09a5b9fbe53088b23c615b6312e'),
    radius: 20,
    ),
    trailing: FlatButton(
    onPressed: () {},
    child: Text('Message',
    style: TextStyle(color: Colors.black)),
    color: Colors.white,
    shape: RoundedRectangleBorder(
    side: BorderSide(
    color: Colors.grey,
    width: 1,
    style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(5))),
    title: SizedBox(
    height: 50,
    width: 145,
    child: Text.rich(TextSpan(
    text:
    'Tan started following you.',
    children: [
    TextSpan(
    text: ' 2w',
    style: TextStyle(color: Colors.grey))
    ])))),
    SizedBox(
    height: 10,
    ),
    ListTile(
    leading: CircleAvatar(
    backgroundImage: NetworkImage(
    'https://randomuser.me/api/portraits/women/44.jpg'),
    radius: 20,
    ),
    trailing: FlatButton(
    onPressed: () {},
    child: Text('Message',
    style: TextStyle(color: Colors.black)),
    color: Colors.white,
    shape: RoundedRectangleBorder(
    side: BorderSide(
    color: Colors.grey,
    width: 1,
    style: BorderStyle.solid),
    borderRadius: BorderRadius.circular(5))),
    title: SizedBox(
    height: 50,
    width: 145,
    child: Text.rich(TextSpan(
    text:
    'Kyaan started following you.',
    children: [
    TextSpan(
    text: ' 3w',
    style: TextStyle(color: Colors.grey))
    ])))),
    ]))
    ]
    ,
    )
    ,
    );
  }
}

class following extends StatelessWidget {
  const following({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('162 Following'),
      ),
    );
  }
}

