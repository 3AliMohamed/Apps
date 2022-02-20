//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/user/user_model.dart';

class Users_Screen extends StatelessWidget {
  List<UserModel> users=[
      UserModel(id:1,
          name:'Ali' ,
          phone:'+2011268312'),
      UserModel(id:5,
        name:'Anas' ,
        phone:'+201126513545312'),
      UserModel(id:1,
        name:'mohamed' ,
        phone:'+2015457548312'),
      UserModel(id:7,
        name:'tarek' ,
        phone:'+201686868312'),
      UserModel(id:1,
        name:'hazem' ,
        phone:'+2013635668312'),
      UserModel(id:1,
        name:'geda' ,
        phone:'+20116545658312'),
      UserModel(id:1,
        name:'darsh' ,
        phone:'+201164154658312'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) => buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              '${user.name}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
