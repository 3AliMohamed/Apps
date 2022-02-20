import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children:
          [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent-lhr8-1.xx.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=v26chtWQhh8AX9let7Z&_nc_ht=scontent-lhr8-1.xx&oh=61b0fd5915fc21b1abf2082913f48485&oe=616ECB6C'
              ),
            ),
            SizedBox(width: 15.0),
            Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions:
        [
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              child: Icon(
                  Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: CircleAvatar(
              radius: 15.0,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
             Container(
               height: 100.0,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index) => buildStoryItem(),
                   separatorBuilder: (context,index)=>SizedBox(
                     width: 10.0,
                   ),
                   itemCount: 10),
             ),
              SizedBox(
                height: 30.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context , index)=>buildChatItem(),
                  separatorBuilder:(context ,index)=>SizedBox(
                  height: 20.0,),
                  itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem()=>  Row(
    children:
    [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://scontent-lhr8-1.xx.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=v26chtWQhh8AX9let7Z&_nc_ht=scontent-lhr8-1.xx&oh=61b0fd5915fc21b1abf2082913f48485&oe=616ECB6C',
            ),
            radius: 30.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),

        ],
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              'Ali Mohamed ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children:
              [
                Expanded(
                  child: Text(
                    'Hello my friend my name is ali how are you ? ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                    '02:00 PM'
                ),
              ],
            ),
          ],
        ),
      ),
    ],

  );
  Widget buildStoryItem()=> Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://scontent-lhr8-1.xx.fbcdn.net/v/t1.6435-9/124686399_3488115654636100_7993384065345407916_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=v26chtWQhh8AX9let7Z&_nc_ht=scontent-lhr8-1.xx&oh=61b0fd5915fc21b1abf2082913f48485&oe=616ECB6C',
              ),
              radius: 30.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),

          ],
        ),
        Text(
          'Ali Mohamed',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
