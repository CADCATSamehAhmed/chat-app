import 'dart:developer';
import 'package:chat_app/core/utils/cache_helper.dart';
import 'package:chat_app/features/auth/data/model/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isObscure = true;

  Future<void> login(
      {required AuthModel authModel, required BuildContext context}) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      await CacheHelper.saveData(key: 'uid', value: userCredential.user!.uid);
      emit(SignInSuccess());
      log("User login Successed: ${userCredential.user!.email}");
    } catch (e) {
      emit(SignInFailure(error: e.toString()));
      // Handle errors here (e.g., show error message)
      log('failed login ${e.toString()}');
    }
  }

  Future<void> signUp(
      {required AuthModel authModel, required BuildContext context}) async {
    emit(AuthLoading());
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'id': userCredential.user!.uid,
        'name': authModel.name,
        'email': authModel.email,
        'phone': authModel.phone,
        'image': 'https://firebasestorage.googleapis.com/v0/b/chatapp-fd0a7.appspot.com/o/statusesImages%2Fuser.png?alt=media&token=242f098e-efb1-45cc-b492-3f4d7057f82f'
      });
      CacheHelper.saveData(key: 'uid', value: userCredential.user!.uid);
      emit(RegisterSuccess());
      log("User registered: ${userCredential.user!.email}");
      // حساب المستخدم تم إنشاؤه بنجاح
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
      log("Error: $e");
    }
  }


  void showPassword() {
    isObscure = !isObscure;
    emit(ShowPasswordSuccess());
  }
}
