import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ElevatedButton.icon(
          onPressed: (){
            // fun to save btn
          },
          icon: Icon(Icons.save),
          label: Text('Save Profile'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
          )),
    );
  }
}
