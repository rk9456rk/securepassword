import 'package:flutter/material.dart';
import 'package:securityapporg/classesforsecure/classinfo.dart';
import 'package:securityapporg/decoration/Mystyle.dart';
import 'package:securityapporg/display/addoptionform.dart';
import 'package:securityapporg/display/disobj.dart';
class Seeinfo extends StatefulWidget {
  

  @override
  _SeeinfoState createState() => _SeeinfoState();
}

class _SeeinfoState extends State<Seeinfo> {
  int count=0;
  Information objinfo=Information(secretpin: '12345', email: 'temp ',uid: '99999');
  List<PassForm> exmanage=[];
  addinexmanage()
  { print('tttt  ');
   setState(()=>exmanage.add(PassForm(title: '****',content:'#####')));
  }
  addincodeobj()
  { objinfo.addininfo(PassForm(title: '****',content:'#####'));

  }
  printtheexmanage()
  {
     exmanage.forEach((ele)
                    {print(ele.title);
                     print(ele.content);

                    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.indigoAccent[700],
             appBar: AppBar(
               title: Text('Information'),
               backgroundColor: Colors.indigo[900],
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.info,
                    color: Colors.white),
                 label: Text('tips',
                 style: TextStyle(color: Colors.white)),
                 onPressed:()//async
                 {  
                 }, 
                 ),
                 
                 
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                // color: Colors.white,  
                 icon: Icon(Icons.home,
                 color: Colors.white),
                 label: Text('home',
                 style: TextStyle(color: Colors.white)),
                 onPressed:()
                 { print('iiiii');
                    Navigator.of(context).pop();
                 }, 
                 ),
                 
               ],
             ),
          body: Container(
              decoration: BoxDecoration(
             
              image: DecorationImage(
               image: AssetImage('assets/secure2.png'),
               fit: BoxFit.cover,
              // matchTextDirection: 
             ),
             // ignore: deprecated_member_use
            //child :Text('Diet app'),
           ),
           child:SingleChildScrollView(
             child: Column(
                     
               children: [
                 Row(
                   children: [
                     Expanded(child: Text('')),
                   ],
                 ),
                 Text('Diet app'),
                 Text(' EMAIL : ${objinfo.email}',style: mystyle),
                   Container(
                  child: Column(
                    children: objinfo.code.map((ele)=>Disobj(objpassform:ele,
                     
                       )
                          
                     
                    ).toList(),
                     
                     
                  ),
                     
                ),
                 
            /*       Container(
                     child: ListView.builder(
         itemCount: exmanage.length,
         itemBuilder: (ele,index)
         { //return PerDayChart(ob1: obj1.day[index]);
              return AddoptionForm(objpassform:ele,
                       delete:(){setState((){  exmanage.remove(ele);});},
                       changeit:(PassForm chanitobj){
                         setState((){exmanage[index]=chanitobj;});
                         printtheexmanage();
                         }
                         );
         },
      ),
                   ),
           */
                
                SizedBox(height:400.0),
               ],
               
             ),

           ),
              ),
         
          );
  }
}