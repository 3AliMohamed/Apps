import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('first App'),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: () {
              print("notification");
            },
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search");
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image(
            image: NetworkImage(
              "https://cdn.pixabay.com/photo/2018/08/05/12/10/rose-3585489__480.jpg"
            ),
            width: 200.0,
            height: 2000.0,
          ),
        ],
      ),
    );
  }
}
