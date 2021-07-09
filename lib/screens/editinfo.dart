import 'package:flutter/material.dart';
import 'package:securityapporg/classesforsecure/classinfo.dart';
import 'package:securityapporg/decoration/Mystyle.dart';
import 'package:securityapporg/display/addoptionform.dart';
import 'package:securityapporg/display/addoptionformsaved.dart';

class Editinfo extends StatefulWidget {
  

  @override
  _EditinfoState createState() => _EditinfoState();
}

class _EditinfoState extends State<Editinfo> {
  Information objinfo=Information(secretpin: '12345', email: 'temp ',uid:'9999999');
  List<PassForm> exmanage=[];
  List<int> objnumber=[];
  List<int> newnumber=[];
  void makeobjnumber(int n)
   {  objnumber=[];
   for(int i=0;i<n;i++)
    objnumber.add(i);
   }
    void makenewnumber(int n)
   {  newnumber=[];
   for(int i=0;i<n;i++)
    newnumber.add(i);
   }
  // makeobjnumber(objinfo.code.length);
  addinexmanage()
  { print('tttt  ');
   setState((){exmanage.add(PassForm(title: '****',content:'#####'));
     makenewnumber(exmanage.length);        
   });
  }
  addincodeobj()
  { objinfo.addininfo(PassForm(title: '****',content:'#####'));
    
  }
  int numnew=0;
  @override

  Widget build(BuildContext context) {
    makeobjnumber(objinfo.code.length);
    return Scaffold(
            backgroundColor: Colors.indigoAccent[700],
             appBar: AppBar(
               title: Text('Edit Information'),
               backgroundColor: Colors.indigo[900],
               elevation : 0.0,
               actions:<Widget>[
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                 icon: Icon(Icons.save,
                    color: Colors.white),
                 label: Text('save \n changes',
                 style: TextStyle(color: Colors.white)),
                 onPressed:()//async
                 {       print('iiiii');
                  exmanage.forEach((ele)
                    { objinfo.addininfo(ele);

                    });
                    setState((){exmanage=[];
                        
                        makeobjnumber(objinfo.code.length);
                    });
                 }, 
                 ),
                 
                 
                 // ignore: deprecated_member_use
                 FlatButton.icon(
                // color: Colors.white,  
                 icon: Icon(Icons.cancel,
                 color: Colors.white),
                 label: Text('cancel \n changes',
                 style: TextStyle(color: Colors.white)),
                 onPressed:()
                 {  
                     print('iiiii');
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
                  Container(// objinfo.code  objnumber
                  child: Column(
                    children: objnumber.map((ele)=>AddoptionForm1(objpassform:objinfo.code[ele],
                     delete:(){setState((){  objinfo.code.remove(objinfo.code[ele]);
                                            makeobjnumber(objinfo.code.length);
                                       
                                        });},
                     changeit:(PassForm chanitobj){setState((){objinfo.code[ele]=chanitobj;});}
                       )
                          
                     
                    ).toList(),
                     
                     
                  ),
                  ),
                 Container(// exmanage newnumber
                  child: Column(
                    children: newnumber.map((ele)=>AddoptionForm(objpassform: exmanage[ele],
                     delete:(){setState((){  exmanage.remove(exmanage[ele]);
                                             makenewnumber(exmanage.length);
                                             });},
                     changeit:(PassForm chanitobj){setState((){ exmanage[ele]=chanitobj;});}
                       )
                          
                     
                    ).toList(),
                     
                     
                  ),
                     
                ),
                SizedBox(height:400.0),
               ],
               
             ),
             
           ),
              ),
          floatingActionButton: FloatingActionButton(
              onPressed: addinexmanage,
              //radius:
             
              child: Column(
                children: [
                  Text( '    new password ',
                  maxLines: 2,
                  style:TextStyle(fontSize:10.0)),
                  Icon(Icons.add),
                ],
              ),
             ),
          );
}
}