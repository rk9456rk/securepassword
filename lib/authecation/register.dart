//import 'package:firefluterrk1/services/auth.dart';
//import 'package:firefluterrk1/shared/contants.dart';

import 'package:flutter/material.dart';
import 'package:securityapporg/classesforsecure/classinfo.dart';
import 'package:securityapporg/decoration/inputdec.dart';
import 'package:securityapporg/services/auth.dart';

class Register extends StatefulWidget {
   final Function toggleview;
  Register({required this.toggleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth= AuthService();
  final _formkey=GlobalKey<FormState>();
   bool loading =false;
  String email ='';
  String password='';
    String secretpin='';
  String error='';
   
  late String _currentname;
  late String _gender;
  late bool _foodtype;
  late double height;
  late double weight;
  late int age;
  //late double _leanfac;
  late double _activity;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text('register to app ' ),
         actions:<Widget>[
           // ignore: deprecated_member_use
           FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text('Sign in'),
           onPressed:()async
           { widget.toggleview();
           //  await   _auth.signOut();
           }, 
           ),
         ],
      ),
  body:Container(
      decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/secure2.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
      child: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 50.0),
             // ignore: deprecated_member_use
             child: Form(
               key: _formkey,
               child: Column(
                 children: <Widget>[
                   
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:textInputDecoration.copyWith(hintText: 'Email'),
                          validator:(val)=>val!.isEmpty?'Enter the email':null,
                          onChanged: (val)
                          {
                            setState(()=>email=val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:textInputDecoration.copyWith(hintText: 'password'),
                          obscureText: true,
                           validator:(val)=>val!.length<6?'Enter the passeord atleast 6 character':null,
                          onChanged: (val)
                          {
                            setState(()=>password=val);
                          },
                        ),
                        SizedBox(height: 20.0),
                         
                      
                      SizedBox(height: 20.0),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.orange[600],
                           child: Text('register ',style:TextStyle(color:Colors.white)),
                           onPressed:() async{

                             setState((){loading=true;
                             
                             
                             
                             });
                            if(_formkey.currentState!.validate())
                            { 
                              dynamic result=await _auth.registerwithemailandpassword(email, password);
                                  if(result==null)
                                  { setState((){ 
                                    error='please provide valid password and password';
                                    loading=false;
                                  });
                                 }  
                                 else
                                 print('registered') ; 
                            }  
                           }
                        ),
                        SizedBox(height: 20.0),
                        Text(error,style: TextStyle(fontSize:15.0,fontWeight:FontWeight.bold,color: Colors.red)),

                        SizedBox(height: 20.0),
                       
                        
                     ],
                   ),
             ),
               
             ),
      ),
      ),
      );
    
  }
}

