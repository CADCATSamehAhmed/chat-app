import 'dart:developer';
import 'package:chat_app/core/utils/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int bottomNavBarIndex = 0;

  void changeBottomNavigationBarIndex(int index) async {
    bottomNavBarIndex = index;
    emit(ChangeBottomNavigationBarIndex());
  }
  Future<void> logOut() async {
    emit(LogOutLoading());
    try {
      await FirebaseAuth.instance.signOut().then((onValue) {
        log("User logged out successfully");
        CacheHelper.removeData(key:'uid');
        emit(LogOutSuccess());
      });
    } catch (e) {
      log("Error logging out: $e");
      emit(LogOutError(error:e.toString()));
    }
  }
}
