import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:chat_app/features/profile/presentation/view_model/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit profileCubit = ProfileCubit.get(context);
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundImage: NetworkImage(profileCubit.userProfile.image),
              ),
              GestureDetector(
                onTap: () {
                  // add function
                },
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: AppColors.mainColor,
                  child: Icon(
                    Icons.edit,
                    size: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
