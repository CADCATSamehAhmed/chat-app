import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearch extends SearchDelegate {
  final List<String> searchItems = [
    'Recent Chats',
    'Online Users',
    'Groups',
    'Settings',
    'Profile',
    'Notifications'
  ];

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
    List<String> matchQuery = searchItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20).w,
      children: [
        Text(
          '${matchQuery.length} results:',
          style: AppFonts.font23,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                matchQuery[index],
                style: AppFonts.font23,
              ),
              leading: const Icon(Icons.search),
              onTap: () {
                // Handle the search result tap
                Navigator.pop(context, matchQuery[index]);
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = searchItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20).w,
      children: [
        Text(
          query.isEmpty ? 'Recent Searches' : 'Suggestions',
          style: AppFonts.font23,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 20.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                matchQuery[index],
                style: AppFonts.font23,
              ),
              leading: const Icon(Icons.history),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                query = matchQuery[index];
                showResults(context);
              },
            );
          },
        ),
      ],
    );
  }
}
