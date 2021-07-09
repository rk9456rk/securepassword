import 'package:securityapporg/classesforsecure/classinfo.dart';

List<String> constrtolist(String s)
{ List<String> ans=[];
  for(int i=0;i<s.length;i++)
  { ans.add(s[i]);}
//for(int i=0;i<ans.length;i++) print(ans[i]);
return ans;
}

String conlisttostr(List<String> s)
{
 String ans='';
 int i=0;
 for(i=0;i<s.length;i++)
 {ans=ans+s[i];}

 return ans;
}
List<String> railfenceencrypt(List<String> s1,List<String> s)
{ 
 // List<String> s=s1;
  List<String> c=s1;
  int j=0;
  for(int i=0;i<s.length;i+=2,j++)
  {c[j] =s[i];}
  for(int i=1;i<s.length;i+=2,j++)
  {   c[j] =s[i];}
  //for(int i=0;i<c.length;i++) print(c[i]);
  //for(int i=0;i<s.length;i++) print(' 1 ${s[i]}');
   return c;
}
List<String> railfencedecrypt(List<String> c,List<String> c1)
{ List<String> s=c1;
  int i=0,j=0;
  for(i=0;j<c.length;i++,j+=2)
  s[j]=c[i];

  for(j=1;j<c.length;j+=2,i++)
  s[j]=c[i];

  return s;
}

Map<String,int> value={};
Map<String ,int> valueofkeyval={};
Map<String,String> valsub={};

String valstr='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!~@#%?^&* ,.[]}{()';
String keyval='TH[Q0]1I!}C~K@B#R^{WNFXJ9&(*UM2PSOV,.EALZ)YDGt3hequi4 5ckbownfxjmp?%6svr7alz8ydg';
void makemapofvalstr()
{ 
  for(int i=0;i<valstr.length;i++)
  {   value[valstr[i]]=i;
      valsub[valstr[i]]=keyval[i];
      valueofkeyval[keyval[i]]=i;
  }
}
String numofoc(String s)
{ String ans;
  int tocon=0;
  int j=1;
  for(int i=2;i>=0;i--,)
 {  if(s[i]=='1') tocon+=j;
    j=j*2;
 }
 ans= tocon.toString();
 return ans;
}
int strtonum7(String s)
{ String ans;
  int tocon=0;
  int j=1;
  for(int i=6;i>=0;i--,)
 {  if(s[i]=='1') tocon+=j;
    j=j*2;
 }
 return tocon;
}
String strofocttobin(int n)
{ String temp='';
   while(n>0)
  {if(n%2==0)
    temp='0'+temp;
   else
     temp='1'+temp;

    n=(n/2).floor();  
  }
 while(temp.length<3)
temp='0'+temp;

return temp;
}
String makestrof(int n)
{ String temp='';
  while(n>0)
  {if(n%2==0)
    temp='0'+temp;
   else
     temp='1'+temp;

    n=(n/2).floor();  
  }
while(temp.length<7)
temp='0'+temp;

return temp;
}
List<String> subsbinencrpt(List<String> s,String key ,String key2)
{ makemapofvalstr();
  List<String> c=[],ans=[],octnum=[];

  for(int i=0;i<s.length;i++)
   { int? put1=value[valsub[s[i]]] != null?value[valsub[s[i]]]:0;
     // ignore: unrelated_type_equality_checks
     int temp=put1!=null?put1:0;
     
     String toput= makestrof(temp);
     for(int j1=0;j1<toput.length;j1++)
     c.add(toput[j1]);
   }
    int lk=key.length;
    int lk2=key2.length;
  for(int i=0;i<c.length;i++)
  { 
    if(key[i%lk]=='1')
    { if(c[i]=='0')
      c[i]='1';
      else
      c[i]='0';
    }

  }
  while(c.length%3!=0)
  c.add('0');
  
  for(int i=0;i<c.length;i++)
{ String temp='';
  for(int j=0;j<3;j++)
  temp=temp+c[i];

  ans.add(numofoc(temp));
}
if(ans.length%2==1)
ans.add('5');
int p1=0;
for(int i=0;i<ans.length;i+=2,p1++)
{ int x1=int.parse(ans[i]+ans[i+1]);
int? put1=value[key2[p1%lk2]] != null?value[key2[p1%lk2]]:0;

   int toaddnum=int.parse(key[p1%lk])+put1!;
   String addthis=keyval[(x1+toaddnum)%80];
 octnum.add(addthis);

}
   return octnum;
}

String fullencrption(String s,String key,String key2)
{ String lenofstr= (s.length).toString();
  if(lenofstr.length==1)
   lenofstr='0'+lenofstr;
   s=lenofstr+s;
  
  String cipher1=conlisttostr(subsbinencrpt(railfenceencrypt(constrtolist(s),constrtolist(s)),key,key2));
  return cipher1;
}

List<String> subsbindecrpt(List<String> cipher1,String key,String key2)
{ makemapofvalstr();
  List<String> ans=[],plainstr=[];
 int lk=key.length;
    int lk2=key2.length;
  for(int i=0;i<cipher1.length;i++)
{ 
int? put1=value[key2[i%lk2]] != null?value[key2[i%lk2]]:0;

   int toaddnum=int.parse(key[i%lk])+put1!;
   int? x1=valueofkeyval[cipher1[i]];
  int octnum=(x1! - toaddnum+80)%80;
   String toaddstr=strofocttobin(octnum);
   for(int k=0;k<3;k++)
   ans.add(toaddstr[k]);
   
   

}
// xor....
for(int i=0;i<ans.length;i++)
  { 
    if(key[i%lk]=='1')
    { if(ans[i]=='0')
      ans[i]='1';
      else
      ans[i]='0';
    }

  }
 while(ans.length%7!=0)
  ans.add('0');
  // str of 7 bit to num to char (use valsubrev....)
  for(int i=0;i<ans.length;i++)
  {String temps='';
    for(int j=0;j<7;j++)
    temps=temps+ans[i];

    int numof7=strtonum7(temps);
    String char1=valstr[numof7%80];
    int? x1=valueofkeyval[char1];
    int num11=x1!;
    String toplain=valstr[num11];
    plainstr.add(toplain);

  }

  return plainstr;

}
String fulldecrption(String cipher1,key,key2)
{  List<String> ans=subsbindecrpt(constrtolist(cipher1), key, key2);
    String s=conlisttostr(railfencedecrypt(ans,ans));
    int numlen=int.parse(s[0])*10+int.parse(s[1]);

    String finaltext='';
    for(int i=2;i<2+numlen;i++)
    finaltext=finaltext+s[i];
    return finaltext;
}
// new fun
int decrptforsize(Information obj)
{ String key='00000000000',key2=obj.uid;
  List<String> ans=subsbindecrpt(constrtolist(obj.secretpin), key, key2);
    String s=conlisttostr(railfencedecrypt(ans,ans));
   
   return (s.length/100).floor();
}
Information retinfodecrpt(Information obj1)
{ return obj1;

}
Information retinfoencrpt(Information obj1)
{
return obj1;
}


                                       // 'thequickbownfxjmpsvralzydg'