
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class New_Msg extends StatefulWidget{
  @override
  _New_Msg createState() => _New_Msg() ;
}

class _New_Msg extends State<New_Msg>{
  var _enteredMsg = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(child:  TextField(
            decoration: InputDecoration(labelText: 'Send a Messege...'),
            onChanged: (value){
              setState(() {
                _enteredMsg = value;
              });
            },
          ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: _enteredMsg.trim().isEmpty? null : (){
            },
          )
        ],
      ),
    );
  }
  
}