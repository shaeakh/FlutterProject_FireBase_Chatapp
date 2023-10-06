import 'package:flutter/material.dart';
import 'package:flutterproject_firebase_chatapp/widgets/auth/auth_form.dart';


class Contacts extends StatefulWidget {
  final String Name;
  final String PhoneNumber;
  Contacts(this.Name,this.PhoneNumber);
  @override
  _Contacts createState() => _Contacts(Name,PhoneNumber);
}

class _Contacts extends State<Contacts> {
  final String Name;
  final String PhoneNumber;
  _Contacts(this.Name,this.PhoneNumber);

  @override
  Widget build(BuildContext context) {
    String imagelink =  'assets/'+Name+'.jpg';
    //print(imagelink);
    final ScreenWeidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xff212529), // Set the color you want for the outline
            width: 2.0, // Set the width of the outline
          ),

        ),
        width: ScreenWeidth-30,
        height: 70,
        margin:  EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: Container(
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  //'assets/'+'Police'+'.jpg',
                  //'assets/Police.jpg',
                  imagelink,
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                child:Text( 'asaas',
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: 10, // Adjust this value to change the font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( 'asdoi',
                      style: TextStyle(
                        color: Colors.transparent,
                        fontSize: 10, // Adjust this value to change the font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text( 'Call : '+Name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15, // Adjust this value to change the font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text( 'Number : '+PhoneNumber,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15, // Adjust this value to change the font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}