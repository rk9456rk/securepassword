import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:securityapporg/classesforsecure/classinfo.dart';
import 'package:securityapporg/crptography/functions.dart';


Map<String,dynamic>  functomapdoc( Information newobjencrpt)
{   Map<String,dynamic> mp1={};
   
 mp1['e1']=newobjencrpt.email;
 mp1['e2']=newobjencrpt.secretpin;  //secretpin contains size of code
 
 for(int i=0;i<newobjencrpt.code.length;i++)
 {mp1['w$i']=newobjencrpt.code[i].title;
  mp1['p$i']=newobjencrpt.code[i].content;
 }
 
 return mp1;
}


class DatabaseService
{ final String uid;
DatabaseService({required this.uid});
  final CollectionReference brewCollection=Firestore.
  instance.collection('datasecure');

// for  updata   ob2 is encrpted
Future updateUserData( Information ob2) async{
  Map<String ,dynamic> st=functomapdoc(ob2);
  return await brewCollection.document(uid).setData(st);

                            
}
// brew list
/*List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot)
{
  return snapshot.documents.map((doc)
  {return Brew( //uid: doc['uid'],
  name: doc.data['name']??'',
  strength:doc.data['strength']??0,sugar: doc.data['sugar']??'0');
  }).toList();
}*/
Information _userDataFromsnapshot(DocumentSnapshot snapshot)
{
Information userinfo=Information(secretpin:snapshot.data['e2'],email:snapshot.data['e1'],uid: uid );

int lenofcode=decrptforsize(userinfo);

for(int i=0;i<lenofcode;i++)
  {  userinfo.code.add(snapshot.data['w$i']);
     userinfo.code.add(snapshot.data['p$i']);
  }

Information userret=retinfodecrpt(userinfo);
return userret;
}
// get user document
Stream<Information> get userData{
  return brewCollection.document(uid).snapshots().map(
    _userDataFromsnapshot
  );
}
}