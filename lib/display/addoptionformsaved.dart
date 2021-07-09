
import 'package:flutter/material.dart';
import 'package:securityapporg/classesforsecure/classinfo.dart';
import 'package:securityapporg/decoration/inputdec.dart';

// ignore: must_be_immutable
class AddoptionForm1 extends StatefulWidget {
  Function delete;
  dynamic objpassform;
  Function changeit;
  AddoptionForm1({required this.delete,required this.changeit,this.objpassform});
  @override
  _AddoptionForm1State createState() => _AddoptionForm1State();
}

class _AddoptionForm1State extends State<AddoptionForm1> {
  PassForm objpassform=PassForm(title:'ooo',content:'####');
  String website='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigoAccent,
      child:Column(
        children: [
          TextFormField(
                                        
            decoration:textInputDecoration.copyWith(hintText: 'WEBSITE'),
                                        initialValue: objpassform.title,
                                        validator:(val)=>val!.isEmpty?'Enter the time':null,
                                        onChanged: ( val)
                                        {
                                          setState(()=>website=val);
                                        },
                                      ),
            TextFormField(
                                        
            decoration:textInputDecoration.copyWith(hintText: 'PASSWORD'),
                                        initialValue: objpassform.content,
                                        validator:(val)=>val!.isEmpty?'Enter the time':null,
                                        onChanged: ( val)
                                        {
                                          setState(()=>password=val);
                                        },
                                      ), 
           Row(
            children: [
              Expanded(
                flex:2,
                // ignore: deprecated_member_use
                child: FlatButton.icon(
            
                               icon: Icon(Icons.done,
                                       size:30),
                               
                               label: Text('Done'),
                               onPressed:()//async
                               { //await _auth.signOut();
                                       print('iiiii');
                                   setState(()=>widget.changeit(PassForm(title: website,content:password)));    
                               //  setState((){   });
                               }, 
                               ),
              ),
               Expanded(
                flex :1,
                child: SizedBox(width: 10.0,),
                               ),                
              Expanded(
                flex: 2,
                // ignore: deprecated_member_use
                child: FlatButton.icon(
                               icon: Icon(Icons.close,size:30),
                               
                               label: Text('delete this \n activity'),
                               onPressed:()//async
                               { //await _auth.signOut();
                                       print('iiiii');
                                 setState(()=>widget.delete());
                               }, 
                               ),
              ),
            ],
          ),                                                     
        ],
      ),
    );
  }
}
