import 'package:clothesshop/first.dart';
import 'package:clothesshop/home.dart';
import 'package:clothesshop/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data&class/data.dart';




List<TextEditingController> tcontroller=[new TextEditingController(),new TextEditingController()
];
bool tfpass=false;
bool tfemail=false;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 30,left:70,right:70,child: Container(
              height: 120,width: 500,child: Image.network('https://i.gifer.com/2iFb.gif'),
            )),
            Positioned(top: 190,child:Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 280,width: 410,child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black54),),
                SizedBox(height: 7,),
                Text('Login',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black54),),
                SizedBox(height: 7,),
                Text('Please sign in to continue',style: TextStyle(color: Colors.grey[400]),),
                SizedBox(height: 15,),
                TextField(controller:tcontroller[0],style:TextStyle(color: Colors.black54),decoration: InputDecoration(
                    errorText: tfemail?'Wrong':null
                    ,labelText: 'Username',labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.mail_outline,color: Colors.grey[400],),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink.shade100),borderRadius: BorderRadius.circular(20))

                ),),
                SizedBox(height: 8,),
                TextField(controller:tcontroller[1],style:TextStyle(color: Colors.black54),decoration: InputDecoration(
                    errorText: tfpass?'Wrong':null
                    ,labelText: 'Password',labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.lock_outline,color: Colors.grey[400]),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink.shade100),borderRadius: BorderRadius.circular(20))

                ),),
              ],
            ),
            ) ,

            ),
            Positioned(top:510,child:Container(height: 150,width:410,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(child: Container(width: 230,height: 60,decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400]
                  ) ,child: Center(child: Text('LOGIN',style: TextStyle(color:Colors.white,fontSize: 16 ),))),onTap: (){
                    if(password.isEmpty)
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)
                      =>SignUp()));
                    else{
                      for(int i=0;i<password.length;i++){
                        if(tcontroller[0].text==email[i]&&tcontroller[1].text==password[i]) {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => First()));
                          tfemail=false;
                          tfpass=false;
                          ind=i;
                          setState(() {
                            tcontroller[0].text="";
                            tcontroller[1].text="";

                          });
                          break;
                        }
                        else if(tcontroller[0].text==email[i]&&tcontroller[1].text!=password[i]){
                          tfemail=false;
                          tfpass=true;
                          setState(() {

                          });
                        }
                        else if(tcontroller[0].text!=email[i]&&tcontroller[1].text==password[i]){
                          tfemail=true;
                          tfpass=false;
                          setState(() {

                          });
                        }
                        else{
                          tfemail=true;
                          tfpass=true;
                          setState(() {

                          });
                        }
                      }

                    }
                  },),
                  TextButton(onPressed: (){}, child: Text('Forget Password?',style: TextStyle(color: Colors.grey[400],fontSize: 15),))
                ],
              )
              ,) ),
            Positioned(bottom:0,left: 100,child:Row(
              children: [
                Text('Don\'t have an account?',style: TextStyle(color: Colors.grey[400],fontSize: 15),),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)
                  =>SignUp()));
                }, child: Text('Sign up',style: TextStyle(color: Colors.black54,fontSize: 15)))
              ],
            ))
          ],
        ),
      ),
      backgroundColor: Color(0xFAF5F5F5),
    );
  }
}
