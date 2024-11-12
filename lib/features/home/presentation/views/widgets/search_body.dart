import 'package:chat_app/core/constants/variables.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate{
  List<String> elements= ['1','2','3'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query ='';
      }, icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context, null);
      }, icon: const Icon(Icons.arrow_back))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery=[];
    for(var element in elements){
      String work = element;
      if(work.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(element);
      }
    }
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth*.05),
      children: [
        Text(
          '${matchQuery.length} result:',
          style: AppFonts.font23,
          textAlign: TextAlign.start,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matchQuery.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              matchQuery[index],
              style: AppFonts.font23,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery=[];
    for(var element in elements){
      String work = element;
      if(work.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(element);
      }
    }
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth*.05),
      children: [
        Text(
          'most Popular Searches',
          style: AppFonts.font23,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: screenWidth*.05,),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matchQuery.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(
              matchQuery[index],
              style: AppFonts.font23,
            );
          },
        ),
      ],
    );
  }

}
