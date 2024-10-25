
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profileimage extends StatelessWidget {
  const Profileimage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('images/profile.png'),
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed:(){
                // add function
              } ,
              icon: Icon( Icons.edit),
              color: Colors.white,
            ),// Use ImageProvider here

          ),

        )
    );

  }
}
