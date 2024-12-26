import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  const GetUserName({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return InkWell(
              splashColor: AppColors.mainColor.withOpacity(.5),
              onTap: () {

              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage: NetworkImage(data['image']),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['name'],
                          style: AppFonts.font20,
                        ),
                        Text(
                          '+20${data['phone']}',
                          style: AppFonts.font18.copyWith(color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return const Text('Loading');
        }));
  }
}
