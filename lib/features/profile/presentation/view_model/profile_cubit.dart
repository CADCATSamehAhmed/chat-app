import 'package:chat_app/core/utils/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/features/profile/data/model/profile_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel userProfile = ProfileModel('', '', '', '', '');

  get fetchUserProfile async {
    emit(GetUserProfileLoading());
    try {
      String id =await CacheHelper.getData(key: 'uid');
      final documentRef =await FirebaseFirestore.instance.collection('users').doc(id).get();
      userProfile = ProfileModel.fromJson(documentRef.data());
      emit(GetUserProfileSuccess());
    } catch (e) {
      emit(GetUserProfileError(error:e.toString()));
    }
  }
}
