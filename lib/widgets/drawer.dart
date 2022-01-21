import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ec593cc431fb70007482137%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1321%26cropX2%3D3300%26cropY1%3D114%26cropY2%3D2093";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children:[
      DrawerHeader(padding: EdgeInsets.zero,
       child: UserAccountsDrawerHeader(
        accountName: Text("Kewal Delhiwala"),
      accountEmail: Text("Kewal@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      )
      )
      ),
      ListTile(
leading: Icon(CupertinoIcons.home,
color: Colors.white,
),
title: Text("Home", textScaleFactor: 1.2,
style: TextStyle(
color: Colors.white,
),
),
      ),
      ListTile(
leading: Icon(CupertinoIcons.profile_circled,
color: Colors.white,
),
title: Text("Profile", textScaleFactor: 1.2,
style: TextStyle(
color: Colors.white,
),
),
      ),
      ListTile(
leading: Icon(CupertinoIcons.mail,
color: Colors.white,
),
title: Text("Email", textScaleFactor: 1.2,
style: TextStyle(
color: Colors.white,
),
),
      )
      
          ]
        ),
      ),

    );
  }
}