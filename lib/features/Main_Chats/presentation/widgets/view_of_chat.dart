import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';

class ViewOfChat extends StatelessWidget {
  String name;
  String number;
  ViewOfChat({super.key,required this.name,required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 45,
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF9E9E9E),
            child: Icon(Icons.person,size: 45,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name,style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                ),),
                Text("# $number",style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey)
                )
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("12:00 PM",style:
                TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey
                ),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 50,bottom: 45),
                child: CircleAvatar(
                  backgroundColor:AppColors.mainColor,
                  foregroundColor: Colors.white,
                  child: Text("2"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
