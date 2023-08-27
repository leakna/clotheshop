import 'package:clothesshop/data&class/favoriteData.dart';
import 'package:clothesshop/favorite.dart';
import 'package:clothesshop/loginscreen.dart';
import 'package:clothesshop/profile.dart';
import 'package:flutter/cupertino.dart';
import 'cartdemo.dart';
import 'data&class/search.dart';
import 'home.dart';
import 'data&class/data.dart';
import 'package:flutter/material.dart';
class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}
var scaffoldKey = GlobalKey<ScaffoldState>();
List<Color> color=[Colors.white38,Colors.white38,Colors.white38];
var tag=['a','b','c'];
var tag2=['d','e','f'];

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {  scaffoldKey.currentState!.openDrawer();},
          icon: Icon(Icons.menu,color: Colors.black,),

        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
            return Profile(); }));
          }, icon: Icon(Icons.contact_page_rounded,color:
            Colors.black,size: 30,))
        ],
      ),
      drawer: Drawer(child: ListView(
        children: [
          // DrawerHeader(child: Text("Labbel")),
          ListTile(leading: Icon(Icons.arrow_back),title: Text("Log out",style: TextStyle(fontSize: 17),),onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
              return LoginScreen();
            }));
           },),
          ListTile(leading: Icon(Icons.favorite),title: Text("Favorite",style: TextStyle(fontSize: 17),),onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
              return Favorite();
            }));
          },),
          ListTile(leading: Icon(Icons.shopping_cart),title: Text("Cart",style: TextStyle(fontSize: 17),),onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
              return CartDemo();
            }));
          },),
        ],
      ),),
      backgroundColor: Color(0xFAF5F5F5),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left:30),
            height: 100,
              child:
                Row(
                  children: [
                    Expanded(
                      flex:5,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          showSearch(context: context, delegate: Search());

                        },
                        child: Container(height:60,decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.2),width: 1),
                            borderRadius: BorderRadius.circular(30),

                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 17,),
                            Icon(Icons.search),
                            SizedBox(width: 15,),
                            Text("Search",style: TextStyle(fontSize: 18),)

                          ],
                        ),),
                      ),
                        
            ),
                    Expanded(
                      flex:1
                    ,child: IconButton(

                      onPressed:(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                          return CartDemo();
                        }));
                      },
                      icon: Icon(Icons.shopping_cart),
                    ))
                  ],
                ),
          ),
          Container(margin: EdgeInsets.only(left: 30),child: Text('Explore',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
          SizedBox(height: 30,),

          Container(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount:dataList.length-2,
                itemBuilder:(context,i){
                color[i]=Colors.white38;
                for(int index=0;index<favdata[ind].length;index++){
                  if(dataList[i]["name"]==favdata[ind][index].name)
                    color[i] = Colors.red;
                  }
               return Container(width: 200,
                  margin: EdgeInsets.only(top: 10,bottom: 10,left:30),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Stack(
                    children: [

                      InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Home(i:i)));
                        },
                        child: Container(height: 150,
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            color: Colors.white60
                        ),
                          child: Image.network('${dataList[i]['img']}'
                          ,fit: BoxFit.cover,),
                          clipBehavior: Clip.hardEdge,

                    ),
                      ),
                      Positioned(top: 12,right:18,
                          child: SizedBox(height: 30,width: 30,
                            child: FittedBox(
                              child: FloatingActionButton(heroTag: tag[i],onPressed: () {
                                print(color==Colors.white38);
                                if(color[i]==Colors.white38){
                                  favdata[ind].add(FavData(name: dataList[i]['name'].toString(), order: i,
                                      image:dataList[i]['img'].toString()));
                                }
                                else{
                                  for(int j=0;j<favdata[ind].length;j++){
                                    if(favdata[ind][j].name==dataList[i]['name'])
                                        favdata[ind].removeAt(j);

                                  }

                                }
                                setState(() {

                                });
                              },
                          child:Icon(Icons.favorite,color: Colors.white),
                          backgroundColor: color[i],
                        ),
                            ),
                      )),
                    ],
                  ),
                    SizedBox(height: 10,),
                    Container(margin: EdgeInsets.only(left: 15),child: Text('${dataList[i]['name']}',style: TextStyle(fontWeight: FontWeight.bold))),
                    SizedBox(height: 20,),
                    Container(margin: EdgeInsets.only(left: 15),child:
                    Row(children: [Text('\$${dataList[i]['price']}',style: TextStyle(fontSize: 18,color: Colors.grey[600]),),
                      SizedBox(width: 85,),
                      SizedBox(height: 30,width: 30,
                          child: FittedBox(
                              child: FloatingActionButton(
                                heroTag: tag2[i],onPressed: (){
                                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Home(i:i)));
                              }, child: Icon(Icons.add),backgroundColor: Colors.grey[400],)))

                    ])),

                  ],
                ),);}


    )),

          SizedBox(height: 30,),
          SizedBox(height: 30,),
          Container(margin: EdgeInsets.only(left:30),height: 50,child:Text('Best Selling',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)) ,),
          SizedBox(height: 2,),
          Clothes(3,context),
          Clothes(4,context),
          
        ],
      ),
    );
  }
}
Container Clothes(int i,context){
  return Container(height: 110,
    margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          spreadRadius: 5.0,
          offset: Offset(1.0, 1.0),
        )
      ],
    ),child:
    Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Home(i:i)));
          },
          child: Container(margin:
          EdgeInsets.only(left: 10),width: 80,height: 80
            ,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
            ),
            child: Image.network('${dataList[i]['img']}',fit: BoxFit.cover,),
            clipBehavior: Clip.hardEdge,
          ),
        ),
        Container(
            margin:EdgeInsets.only(top: 20,left: 10),
            width: 180,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${dataList[i]['name']}',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Text('\$${dataList[i]['price']}',style: TextStyle(fontSize: 15,letterSpacing: 1),),
              ],
            )),
        SizedBox(width: 20,),

        Stack(
          children: [  InkWell(
            child: Container(margin: EdgeInsets.only(top: 40),
              width: 35,height: 35,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]
              ),),

          ),
            Positioned(top:48,left:8,
              child: Icon(Icons.arrow_forward,size: 20,color: Colors.white,),
            )],
        )
      ],
    ),);

}
class Search extends SearchDelegate{
  List<SearchData> searchT=[];
  Search(){
    for(int i=0;i<dataList.length;i++){
      searchT.add(SearchData(n: i, name: dataList[i]['name'].toString()));
    }
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){
        query='';
      }, icon: Icon(Icons.clear))

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      close(context, null);
      Navigator.push(context,MaterialPageRoute(builder:(context)=>First()));
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<SearchData> matchQuery = [];
    for (var fruit in searchT)
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(SearchData(n: fruit.n, name: fruit.name));
      }
        return ListView.builder(
            itemCount: matchQuery.length
            , itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchQuery[index].name),
            onTap: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)
              =>Home(i:matchQuery[index].n)));
            },
          );
        });

  }

}