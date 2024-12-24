import 'package:chat_app/features/chat/presentation/views/main_chats.dart';
import 'package:chat_app/features/home/presentation/view_model/get_user_name.dart';
import 'package:chat_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:chat_app/features/home/presentation/view_model/home_states.dart';
import 'package:chat_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_floating_action_button.dart';
import 'package:chat_app/features/status/presentation/views/status_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final user = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIDs =[];

  //get docIDs
  Future getDocId() async{
    await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((document){
              print(document.reference);
              docIDs.add(document.reference.id);
            }),


    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: const BuildAppBar(),
            body: homeScreens[homeCubit.bottomNavBarIndex],
            bottomNavigationBar: BottomNavBar(
              currentIndex: homeCubit.bottomNavBarIndex,
              onTap: (int index) {
                homeCubit.changeBottomNavigationBarIndex(index);
                Expanded(
                  child:FutureBuilder(
                      future: getDocId(),
                      builder:(context, snapshot){
                        return ListView.builder(
                          itemCount: docIDs.length,
                            itemBuilder: (context, index){
                            return ListTile(
                              title: GetUserName(documentId: docIDs[index]),
                            );
                            });                     }
                  ) ,
                );
              },
            ),
            floatingActionButton: HomeFloatingActionButton(index: homeCubit.bottomNavBarIndex),
          );
        },
      ),
    );
  }
}



List<Widget> homeScreens = [
  const MainChats(),
  const StatusView(),
  Container(),
];
