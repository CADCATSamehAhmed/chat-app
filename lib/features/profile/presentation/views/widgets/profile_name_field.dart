import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileNameField extends StatelessWidget {
  //final TextEditingController profileNameController ;
  const ProfileNameField({super.key , });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal:20.w,vertical:10.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 3,
                blurRadius: 15,
                offset: const Offset(-1, 15)
            )
          ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: TextEditingController(text: "Marwan Ali") ,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        onChanged: (value){
          /* change of update profile
        * viewModel.updateProfile(
                  value, viewModel.userProfile.phoneNumber);*/
        },
      ),
    );
  }
}
