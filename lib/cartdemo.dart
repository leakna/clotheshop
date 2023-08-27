import 'package:clothesshop/data&class/data.dart';
import 'package:clothesshop/first.dart';
import 'package:clothesshop/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartDemo extends StatefulWidget {
  const CartDemo({Key? key}) : super(key: key);

  @override
  State<CartDemo> createState() => _CartDemoState();
}
class _CartDemoState extends State<CartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Center(
          child: Text("Cart"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.home),onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>First()));
          },),
          SizedBox(width: 10,)
        ],
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>First()));
        },icon: Icon(Icons.arrow_back),),

      ),
      body: Container(

        child: Column(
          children: [
            Container(height: 560,width:double.infinity,
              child:
              ListView.builder(
                itemCount: cartItem[ind].length,
                itemBuilder: (context,i){
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
                          cartItem[ind][i].img
                      ,fit: BoxFit.cover,),
                      clipBehavior: Clip.hardEdge,),
                        Container(
                          padding: EdgeInsets.only(top: 50,left: 10),
                          height: double.infinity,
                          width: 130,
                          child: InkWell(
                          child:Text(cartItem[ind][i].name,style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),),
                            onTap: (){
                            indexPic=cartItem[ind][i].color;
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                                return Home(i:cartItem[ind][i].order );
                              }));
                            },
                          ),
                        )
                      ,
                      SizedBox(width: 30,),
                      IconButton(onPressed: (){
                        setState(() {
                          cartItem[ind][i].qty-=1;
                          totalprice[ind]-=cartItem[ind][i].price;
                          if(cartItem[ind][i].qty==0)
                            cartItem[ind].removeAt(i);
                        });
                      }, icon: Icon(Icons.remove)),
                      Text("${cartItem[ind][i].qty}",style:TextStyle(fontSize: 20),)
                        ,IconButton(onPressed: (){
                          setState(() {
                            cartItem[ind][i].qty+=1;
                            totalprice[ind]+=cartItem[ind][i].price;
                          });
                        }, icon: Icon(Icons.add)),],
                      
                    ),
                  );
                },

              ),)

          ,
          Container(width: double.infinity,height: 60,
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(flex:3,child:Text("Total",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.grey[600])),),
              Expanded(flex:1,child: SizedBox(width: 310,),),
              Expanded(flex: 2,child:Text("\$${totalprice[ind].toStringAsFixed(2).toString()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),)
            ],
          ),),
          InkWell(
            onTap: (){
              int n=cartItem[ind].length;
              print(n);
              buy_time[ind]+=1;
              totalprice[ind]=0;
              for(int i=0;i<n;i++){
                cartItem[ind].removeAt(0);
              }
              setState(() {

              });
            },
            child: Container(width:double.infinity ,height: 80,
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Center(
                child: Text("Order",style: TextStyle(color: Colors.white,fontSize: 20
                ,fontWeight: FontWeight.w600),
            )),
              decoration: BoxDecoration(color: Colors.grey,

                 borderRadius: BorderRadius.circular(30),)),
          )
        ],
        ),
      ),
    backgroundColor: Color(0xFAF5F5F5),);
  }
}
