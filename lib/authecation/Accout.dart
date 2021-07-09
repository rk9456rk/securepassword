

//import 'package:dietapp/screen/authecation/authication.dart';
//import 'package:dietapp/screen/createdietchart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securityapporg/services/auth.dart';

// ignore: must_be_immutable
class Account extends StatelessWidget {
   //final AuthService _auth= AuthService();
  @override
  dynamic userDataobj;
  Account({this.userDataobj});
  
  Widget build(BuildContext context) {
 // final userDataobj=Provider.of<Userdata>(context);  
 
  final AuthService _auth= AuthService();
    return  Scaffold(
         backgroundColor: Colors.green,
         appBar: AppBar(
           title: Text('Account'),
           backgroundColor: Colors.amber,
           elevation : 0.0,
           actions:<Widget>[
             // ignore: deprecated_member_use
             FlatButton.icon(
             icon: Icon(Icons.person),
             label: Text('logout'),
             onPressed:() async
             { //await _auth.signOut();
                     print('iiiii');
                     await _auth.signOut();
               Navigator.of(context).pop();
               
             }, 
             ),
             // ignore: deprecated_member_use
             FlatButton.icon(
             icon: Icon(Icons.info),
             label: Text('info'),
             onPressed:(){}, 
             ),
             // ignore: deprecated_member_use
           ],
         ),
         body :Container(
           decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage('assets/secure.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
            //child: Text(' gg'),
           ),
         child: Column(
             children: [
               Row(
                 children: [
                   Expanded(child: Text(' ')),
                 ],
               ),
               Center(
                 child:Column(
                   children: [
                     SizedBox(height:120.0),
                     
                   ],
                 ),
      
                 ),

             ],
           ),
            // ignore: deprecated_member_use
          /*  child: FlatButton.icon(
             icon: Icon(Icons.email),
             label: Text('createchart'),
             onPressed:()
             { print('iiiii');
               Navigator.of(context).push(
                 MaterialPageRoute(
                   builder:(context)=>CreateChart()
                 )
               );
             }, 
             ),*/
             ),
           
          // child: Brewlist()),
      //),
    );
  }
}