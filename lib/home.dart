import 'package:clothesshop/cartdemo.dart';
import 'package:clothesshop/data&class/favoriteData.dart';
import 'package:clothesshop/first.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'data&class/cart.dart';
import 'data&class/data.dart';
class Home extends StatefulWidget {
  final int i;
  const Home({Key? key,required this.i}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
double star=3;
int indexPic=0;
late Color fcolor;
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    fcolor=Colors.white38;
    var selectedImg=img[widget.i][indexPic];
    for(int index=0;index<favdata[ind].length;index++){
      if(favdata[ind][index].name==dataList[widget.i]["name"])
        fcolor=Colors.red;
    }
    return Scaffold(
      body:SafeArea(
        child: Stack(
          children: [
            Container(
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50)

                ),
                color: Colors.pink,
              ),
              child: Image(
                image: NetworkImage(selectedImg.toString(),

                ),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              clipBehavior: Clip.hardEdge,

            ),
            Container(
              height: 900,
            ),
            Positioned(left: 10,top:10,child: InkWell(
              onTap: (){
                indexPic=0;
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>First()));},
              child: Icon(
                Icons.arrow_back
              ),
            )),
            Positioned(left: 180,top:10,child: Text("Item",style: TextStyle(
              fontSize: 25,fontWeight: FontWeight.bold
            ),),),
            Positioned(right:1,
              child: IconButton(
                icon:Icon(Icons.shopping_cart_outlined,size: 30,), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return CartDemo();
                  setState(() {

                  });
                }));
              },
              ),
            ),
            Positioned(right: 20,bottom: 300,child: FloatingActionButton(
              heroTag: 'first',
              child: Icon(Icons.favorite,color: Colors.white,),
              backgroundColor: fcolor, onPressed: () {
              if (fcolor == Colors.white38)
                favdata[ind].add(FavData(name: dataList[widget.i]["name"].toString(),
                    order: widget.i,
                    image: dataList[widget.i]["img"].toString()));
              else
                for (int index = 0; index < favdata[ind].length; index++) {
                  if (favdata[ind][index].name == dataList[widget.i]["name"]) {
                    favdata[ind].removeAt(index);
                    print("yes");
                  }
                }
                setState(() {

                });


            }

            )),
            Positioned(bottom: 280,left: 25,child: Text('\$${dataList[widget.i]['price']}',style: TextStyle(
              color: Colors.black54,fontSize: 25,
              fontFamily: "Open",fontWeight: FontWeight.w800
            ),)),
            Positioned(bottom: 260,left: 25,child: Text('${dataList[widget.i]['name']}',style: TextStyle(
              color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,
            ),)),
            Positioned(bottom: 260,right: 15,child: Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  //minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemCount: 5,
                  unratedColor: Colors.grey[400]
                  ,itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    weight: 10,
                    color: Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    star=rating;
                    setState(() {

                    });
                  },
                ),
                SizedBox(width: 7,)
               , Text(star.toString(),style: TextStyle(fontSize: 15),)
              ],
            )),
            Positioned(bottom: 220,left:25,child: Text("Color option",))
            ,Positioned(bottom: 170,left:15,
                 child: Container(height: 50,width: 300,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount:colors[widget.i].length ,
                     itemBuilder: (context,i){
                     return Container(height:20,width:20,margin: EdgeInsets.only(top:10,left: 10),
                          child: FittedBox(
                              child: FloatingActionButton(
                                heroTag: i.toString(),
                                 onPressed: () {
                                   indexPic=i;
                                   setState(() {

                                   });
                                 },
                                backgroundColor:colors[widget.i][i],
                              ),



                         ),
                     );}
                   ),
                 )

               
             
            ),
        Positioned(bottom: 150,left:25,
          child: Text("Description"),
        ),

            Positioned(bottom: 95,left:25,
              child: Container(width: 400,height: 50,
                child: Text('${dataList[widget.i]['description']}',
                style: TextStyle(color: Colors.grey),),
              ),
            ),
            Positioned(right:0,bottom: 0,child: InkWell(onTap: (){},
              child: InkWell(
                child: Container(padding:EdgeInsets.only(top:30,left:45),height:70,width:200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50)
                  ),
                    color:Colors.blueGrey[900],),
                child: Text('+ ADD TO CART',style: TextStyle(color: Colors.white,fontSize: 17),),),

             onTap: (){

                  bool exist=false;
                  for(int j=0;j<cartItem[ind].length;j++){
                    print("hi");
                    if(cartItem[ind][j].name==dataList[widget.i]['name']&&
                        cartItem[ind][j].color==indexPic){
                      cartItem[ind][j].qty+=1;
                      totalprice[ind]+=cartItem[ind][j].price;
                      exist=true;

                    }
                  }
                  if(exist==false) {
                    print('true');
                    cartItem[ind].add(Cart(name:dataList[widget.i]['name'].toString(),img:img[widget.i][indexPic],
                  color: indexPic,qty:1,order: widget.i,price: double.parse(dataList[widget.i]["price"].toString())));
                    totalprice[ind]+=double.parse(dataList[widget.i]["price"].toString());
                  }
             }, ),
            ))



          ],
        ),
      )
    );
  }
}
