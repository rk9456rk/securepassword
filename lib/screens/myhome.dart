


import 'package:flutter/material.dart';
import 'package:securityapporg/screens/editinfo.dart';
import 'package:securityapporg/screens/seeinfo.dart';


class Homemy extends StatelessWidget {
   //final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    //final user=Provider.of<User>(context);
  // final AuthService _auth= AuthService();
      
          return Scaffold(
            backgroundColor: Colors.green,
             appBar: AppBar(
               title: Text('Security App'),
               backgroundColor: Colors.indigo[900],
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.remove_red_eye,color: Colors.white),
                 label: Text('see \n info',
                 style: TextStyle(color: Colors.white)),
                 onPressed:()//async
                 { //await _auth.signOut();
                        print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Seeinfo()
                     )
                   );
                 }, 
                 ),
                 // ignore: deprecated_member_use
                 
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                // color: Colors.white,  
                 icon: Icon(Icons.edit,color: Colors.white),
                 label: Text('edit \n info',
                 style: TextStyle(color: Colors.white)),
                 onPressed:()
                 { print('iiiii');
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder:(context)=>Editinfo()
                     )
                   );
                 }, 
                 ),
                 
               ],
             ),
          body: Container(
              decoration: BoxDecoration(
             
              image: DecorationImage(
               image: AssetImage('assets/secure1.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
           child:Column(
             children: [
               Row(
                 children: [
                   Expanded(child: Text('')),
                 ],
               ),
               Text('Diet app'),
             ],
           ),
      ),
          
          );
    
  }
}