
import 'package:clothesshop/data&class/data.dart';
import 'package:clothesshop/first.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favorite")),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black54,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>First()));
        },icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: (){
            Navigator.popUntil(context, (route) => route.isFirst);
          }, icon: Icon(Icons.home)),
          SizedBox(width: 15,)
        ],
      ),
      body:
        ListView.builder(
            itemCount: favdata[ind].length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                height: 120,width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      spreadRadius: 5.0,
                      offset: Offset(1.0, 1.0),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(width: 100,height: 100,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                    ),child: Image.network(
                      favdata[ind][index].image
                      ,fit: BoxFit.cover,),
                      clipBehavior: Clip.hardEdge,),
                    Container(
                      padding: EdgeInsets.only(top: 50,left: 10),
                      height: double.infinity,
                      width: 130,
                      child: InkWell(
                        child:Text(favdata[ind][index].name,style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                            return Home(i:favdata[ind][index].order );
                          }));
                        },
                      ),
                    )
                    ,
                    SizedBox(width: 30,),
                  InkWell(child: Container(height: 50,width: 100,child:
                    Center(child: Text('Remove',)),decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),

                ),
                  onTap: (){
                    favdata[ind].removeAt(index);
                    setState(() {
                      
                    });
                  },
                  )]
              ));

        })

    );
  }
}
