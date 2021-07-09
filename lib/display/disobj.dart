import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Disobj extends StatefulWidget {
  dynamic objpassform;
  Disobj({this.objpassform});
  @override
  _DisobjState createState() => _DisobjState( objpassform:objpassform);
}

class _DisobjState extends State<Disobj> {
  //PassForm objpassform=PassForm(title:' uuu ',content:'rrrr');
  dynamic objpassform;
  _DisobjState({this.objpassform});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: 
      Column(
        children: [
          Row(
            children: [
              Expanded(flex :2,child: Text('${objpassform.title}')),
              Expanded(flex :2,child: Text('${objpassform.content}')),
            ],
          ),
        ],
      )
    );
  }
}