import 'package:clothesshop/data&class/data.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Center(child: Text("Profile")),
        actions: [
          SizedBox(width: 58,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             SizedBox(height: 10),
             CircleAvatar(
                radius: 50,
                child: Image.network('https://static.thenounproject.com/png/4035892-200.png',
                  fit: BoxFit.cover,
                ),
                backgroundColor: Colors.transparent,

            ),
          SizedBox(height: 10),
            Text(name[ind],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
            SizedBox(height: 5),
            Text(pnum[ind].toString()),
            SizedBox(height: 5,),
            Row(
              children: [
                Text(email[ind],style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black54),),
                SizedBox(width: 5,),
                Icon(Icons.email,size: 17,color:Colors.black54 ,)
              ],
            ),
            SizedBox(height: 50,),
            Text("Count of Your Buy:"),
            Text(buy_time[ind].toString(),style:TextStyle(fontSize: 50),)
          ],
        ),
      ),

    );
  }
}
