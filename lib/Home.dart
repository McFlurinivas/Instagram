import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo/main.dart';
import 'package:insta_demo/DM.dart';

class home extends StatelessWidget {

  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(EvaIcons.camera),
        title: Center(child: Text('Instagram', style: TextStyle(fontSize:40,fontFamily: 'Billabong', color: Colors.black))),
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

class posts {
  final String url1;
  final String name;
  final String url;

  posts(this.url, this.name, this.url1);
}

List<posts> postt = [
  posts("https://uifaces.co/our-content/donated/3799Ffxy.jpeg", "Cristine",
      'https://ggsc.s3.amazonaws.com/images/uploads/The_Science-Backed_Benefits_of_Being_a_Dog_Owner.jpg'),
  posts("https://uifaces.co/our-content/donated/KtCFjlD4.jpg", "Ben",
      'https://cdn.britannica.com/08/187508-050-D6FB5173/Shanghai-Tower-Gensler-San-Francisco-world-Oriental-2015.jpg'),
  posts("https://uifaces.co/our-content/donated/gPZwCbdS.jpg", "Hari",
      'https://cdn.mos.cms.futurecdn.net/wtqqnkYDYi2ifsWZVW2MT4-1200-80.jpg'),
  posts("https://randomuser.me/api/portraits/men/36.jpg", "Wilson",
      'https://images.pexels.com/photos/111755/pexels-photo-111755.jpeg?cs=srgb&dl=pexels-pattama-choomsree-111755.jpg&fm=jpg'),
  posts("https://uifaces.co/our-content/donated/1H_7AxP0.jpg", "Patrick",
      'https://i.pinimg.com/originals/86/3e/ef/863eef974d1011a0d3c7a2698591bb3e.jpg'),
  posts("https://randomuser.me/api/portraits/women/79.jpg", "Muri",
      'https://www.desicomments.com/dc3/21/445063/445063.png'),
  posts(
      "https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=3759e09a5b9fbe53088b23c615b6312e",
      'Tan',
      'https://parade.com/wp-content/uploads/2019/10/Life-Quotes-Dolly-680x430.jpg'),
  posts("https://randomuser.me/api/portraits/men/32.jpg", "Nas",
      'https://images2.minutemediacdn.com/image/upload/c_crop,h_726,w_1292,x_199,y_0/f_auto,q_auto,w_1100/v1578352479/shape/mentalfloss/62455-shout-factory1.jpg'),
  posts("https://uifaces.co/our-content/donated/vIqzOHXj.jpg", "Kapi",
      'https://s3.scoopwhoop.com/anj2/5fbb819960c0603f5625e604/222f1044-32a8-4e69-ae15-d1070d954086.jpg'),
  posts("https://randomuser.me/api/portraits/women/44.jpg", "Kyaan",
      'https://miro.medium.com/max/1200/0*s7vGN34hz5jJUYTm.png')
];

class post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(postt.length, (index) => photo(context, index)),
    );
  }

  Widget photo(BuildContext context, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(
              radius: 20, backgroundImage: NetworkImage(postt[index].url)),
          title: Text(
            postt[index].name,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Image.network(postt[index].url1),
        Row(
          children: [
            IconButton(
              icon: Icon(EvaIcons.heartOutline),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('You Have Liked The Post',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center)));
              },
            ),
            //SizedBox(),
            Icon(Icons.insert_comment_outlined),
            SizedBox(width: 10),
            Icon(EvaIcons.paperPlaneOutline),
          ],
        ),
        ListTile(
          leading: CircleAvatar(
              radius: 10, backgroundImage: NetworkImage(postt[index].url)),
          title: Text(
            'Liked by ' + postt[index].name + ' and 455,885 others',
            style: (TextStyle(fontSize: 15)),
          ),
          dense: true,
          //contentPadding: EdgeInsets.fromLTRB(10, 0, 50, 10),
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: [
                Text('joshua_l', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(' Nice photo'),
              ],
            )),
        SizedBox(height: 10,)
      ],
    );
  }
}
