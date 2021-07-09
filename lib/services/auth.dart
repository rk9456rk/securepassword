import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:securityapporg/classesforsecure/classinfo.dart';
import 'package:securityapporg/crptography/functions.dart';
import 'package:securityapporg/services/database.dart';
import 'package:securityapporg/services/ser_object.dart';

class AuthService
{  final FirebaseAuth _auth= FirebaseAuth.instance;
    // user in class user
User _userFromFirebaseUser(FirebaseUser user)
{
  // ignore: unnecessary_null_comparison
  if(user!=null)
  return  User(uid: user.uid);
   return User(uid:'not valid');
}
Stream<User> get user{
   return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
   }
/*String _userFromFirebaseUserdata(FirebaseUser user)
{ if(user!=null)
  return  user.uid;
   return 'not valid';

}   
Stream<Userdata> get userdatastream
{
  final ispresent= _auth.onAuthStateChanged.map(_userFromFirebaseUserdata);
   if(ispresent=='not valid')
   return Userdata(uid: 'not valid');

} */
  // sign in anynomous
   Future signInAnon() async{
     try{
           AuthResult result= await _auth.signInAnonymously();
           FirebaseUser user=result.user;
          // await DatabaseService(uid: user.uid).updateUserData('new anon',100);
           return user;
           // await DatabaseService(uid: user.uid).updateUserData('0','new anon',100);
          // return _userFromFirebaseUser(user);
     }
     catch(e)
     {  //print(e.tostring());
        print('not connect in anon');
        return null;
   
     }
   }
    //register
   Future registerwithemailandpassword(String email,String password) async
   { try{

      AuthResult result=await _auth.createUserWithEmailAndPassword(email:email,password:password);
      FirebaseUser user=result.user;
    //create the document
     Information obj2=Information(email:email,secretpin: password,uid:user.uid);

     await DatabaseService(uid: user.uid).updateUserData(retinfoencrpt(obj2));
                   return user;
     // return  _userFromFirebaseUser(user);
      }
      catch (e)
      { print('not sign in');
        //print (e.tostring());
        return null;
      }

   }


     // sigin email
   Future signinwithemailandpassword(String email,String password) async
   { try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email,password : password);
      FirebaseUser user=result.user;
    // await DatabaseService(uid: user.uid).updateUserData('0','new anon',100);
    //  return  _userFromFirebaseUser(user);
     return user;
     }
      catch (e)
      {
        //print (e.tostring());
        return null;
      }

   }
   // sign out
   Future signOut() async
   {
      try{ return await _auth.signOut();}
      catch (e)
      { print(' not sign out');
       // print (e.tostring());
        return null;
      }
   }
   Future updatadirectbyobj(Information userobject12)
   async
   { try{return await DatabaseService(uid: userobject12.uid).updateUserData(userobject12);}
       catch (e)
       {
         print('not updated');
         return null;
       }  
   }
}
