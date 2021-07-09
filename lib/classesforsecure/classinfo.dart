


class PassForm
{ String title;
  String content;
  PassForm({required this.title,required this.content});
}
class ListpassForm
{ int index1;
  late PassForm passform;//=PassForm;

  ListpassForm({required this.index1});

}
class Information
{String uid;
 String secretpin;
 String email;
 List<PassForm> code=[];
  Information({required this.secretpin,required this.email,required this.uid});

 void addininfo(PassForm obj)
 {  code.add(obj);

 }

}