import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data&class/data.dart';



List<TextEditingController> tcontroller=[new TextEditingController(),new TextEditingController()
  ,new TextEditingController(),new TextEditingController(),new TextEditingController()];
bool confirm=true;
// bool empPas=false,empEmail=false,empName=false,empNumber=false,empConfirm=false;
List<bool> emp=[false,false,false,false,false,false];
bool checkEmail=false;
String? tName;
int? tnum;
String? temail;
String? tpass;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white60,
      ),
      backgroundColor: Color(0xFAF5F5F5),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(left: 20,right:20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black54),),
              SizedBox(height: 10,)

              ,Text('Please fill the input below here',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.grey[400]),),
              SizedBox(height: 30,),
              TextField(style:TextStyle(color: Colors.black),controller: tcontroller[0],decoration: InputDecoration(
                  labelText: 'Full Name',
                  errorText: emp[0]?'Please input':null
                  ,labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.person_outline,color: Colors.grey[600],size: 40,),
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20)),
                  errorBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20))

              ),),
              SizedBox(height: 25,),
              TextField(style:TextStyle(color: Colors.black),controller: tcontroller[1],decoration: InputDecoration(
                  labelText: 'Phone Number',
                  errorText: emp[1]?'Please input':null
                  ,labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.phone_android,color: Colors.grey[600],size: 40,),
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20)),
                  errorBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20))

              ),),
              SizedBox(height: 25,),
              TextField(style:TextStyle(color: Colors.black),controller: tcontroller[2],decoration: InputDecoration(
                  labelText: 'Email',labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.email_outlined,color: Colors.grey[600],size: 40),
                  errorText: emp[2]?'Please input':checkEmail?'Familiar username':null
                  ,enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20)),
                  errorBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20))

              ),),
              SizedBox(height: 25,),
              TextField(style:TextStyle(color: Colors.black)
                ,controller: tcontroller[3],
                decoration: InputDecoration(
                    errorText: emp[3]?'Please input':null,
                    labelText: 'Password',labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.lock_outline,color: Colors.grey[600],size: 40,),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20)),
                    errorBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20))

                ),),
              SizedBox(height: 25,),
              TextField(style:TextStyle(color: Colors.black),controller: tcontroller[4],decoration: InputDecoration(
                  labelText: 'Password',errorText: emp[4]==false?(confirm==false?'WTF':null):'Please input',
                  labelStyle: TextStyle(color: Colors.grey[400]),prefixIcon: Icon(Icons.lock_outline,color: Colors.grey[600],size: 40,),
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20)),
                  errorBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20))

              ),),
              SizedBox(height: 25,),
              Container(
                height:60,
                width: double.infinity,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      if((tcontroller[0].text.isNotEmpty&&tcontroller[1].text.isNotEmpty)&&
                          (tcontroller[2].text.isNotEmpty&&tcontroller[3].text.isNotEmpty)&&
                          tcontroller[4].text.isNotEmpty){
                        for(int i=0;i<email.length;i++){
                          if(tcontroller[2].text==email[i]) {
                            checkEmail = true;
                            setState(() {

                            });
                            break;
                          }
                          checkEmail=false;
                          }
                        for(int i=0;i<emp.length;i++)
                          emp[i]=false;

                      if(!checkEmail)
                        if(tcontroller[3].text==tcontroller[4].text) {
                          name.add(tcontroller[0].text);
                          pnum.add(tcontroller[1].text);
                          email.add(tcontroller[2].text);
                          password.add(tcontroller[3].text);
                          tcontroller[0].text="";
                          tcontroller[1].text="";
                          tcontroller[2].text="";
                          tcontroller[3].text="";
                          tcontroller[4].text="";
                          confirm=true;
                          favdata.add([]);
                          cartItem.add([]);
                          totalprice.add(0);
                          buy_time.add(0);


                          Navigator.pop(context);
                        }
                        else {
                          confirm = false;
                          setState(() {
                          });
                        }
                      }
                      else{
                        for(int i=0;i<tcontroller.length;i++){
                          if(tcontroller[i].text.isEmpty) {
                            print('helo');
                            emp[i] = true;
                          }
                          else {
                            emp[i] = false;
                            if(tcontroller[3].text.isNotEmpty&&tcontroller[4].text.isNotEmpty){
                              if(tcontroller[3].text!=tcontroller[4].text)
                                confirm=false;
                            }
                          }
                          setState(() {
                          });
                        }
                      }
                    },
                    child: Container(
                        height: double.infinity,width: 200,
                        child:Center (child: Text('SIGN UP',style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 15
                        ),)),
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[400]
                        )

                    ),
                  ),
                ),
              ),
              SizedBox(height:50),
              Container(width: double.infinity,height: 50,
                padding: EdgeInsets.only(left:90),
                child: Row(
                  children: [
                    Text('Already have a account?',style: TextStyle(color: Colors.grey[400]),),
                    TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Sign In',style: TextStyle(color: Colors.grey[600])))
                  ],
                ),)

            ],
          ),
        ),
      ),
    );
  }
}

