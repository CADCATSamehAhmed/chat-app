import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomSearch extends SearchDelegate {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: query.isEmpty
          ? _firestore.collection('users').get()
          : _firestore
              .collection('users')
              .where('name', isGreaterThanOrEqualTo: query)
              .where('name', isLessThan: query + 'z')
              .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final users = snapshot.data?.docs ?? [];

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          children: [
            Text(
              query.isEmpty ? 'All Users' : '${users.length} results found',
              style: AppFonts.font23,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.h),
            ...users.map((doc) {
              final userData = doc.data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userData['image'] ?? ''),
                  backgroundColor: Colors.grey[300],
                ),
                title: Text(
                  userData['name'] ?? '',
                  style: AppFonts.font18,
                ),
                subtitle: Text(userData['email'] ?? ''),
                onTap: () {
                  // TODO: Navigate to chat or user profile
                  close(context, userData);
                },
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
