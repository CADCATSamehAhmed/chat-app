// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:chat_app/features/auth/data/model/auth_model.dart';
import 'package:chat_app/features/auth/data/view_model/auth_states.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController phoneControler = TextEditingController();
  bool isObscure = true;

  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // استخدام RegExp للتحقق من صحة البريد الإلكتروني
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null; // لا يوجد خطأ، البريد الإلكتروني صحيح
  }

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    // استخدام RegExp للتحقق من أن الاسم يحتوي فقط على حروف ومسافات
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Please enter a valid name (letters and spaces only)';
    }

    return null; // لا يوجد خطأ، الاسم صحيح
  }

  String? phoneNumberValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    // استخدام RegExp للتحقق من أن الرقم مكون من 10 أرقام
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number (10 digits)';
    }

    return null; // لا يوجد خطأ، رقم الهاتف صحيح
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // استخدام RegExp للتحقق من كلمة المرور
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long, contain a number, an uppercase letter, and a special character';
    }

    return null; // لا يوجد خطأ، كلمة المرور صحيحة
  }

  Future<void> login(
      {required AuthModel authModel, required BuildContext context}) async {
    emit(AuthLoading());
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      )
          .then((onValue) {
        emit(SignInSuccess());
        log("User login Succssed: ${onValue.user!.email}");
        Get.to(() => const HomeView());
      });
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
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      )
          .then((onValue) {
        emit(RegisterSuccess());
        Get.to(() => const HomeView());
        log("User registered: ${onValue.user!.email}");
        return onValue;
      });
      // حساب المستخدم تم إنشاؤه بنجاح
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
      log("Error: $e");
    }
  }

  void showInSnackBar({required BuildContext context, required String value}) {
    emit(ShowSnackBar());
    final snackBar = SnackBar(
      content: Text(value),
      duration: const Duration(seconds: 3), // تحديد مدة عرض الـSnackBar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showPassword() {
    isObscure = !isObscure;
    emit(ShowPassswordSuccess());
  }
}
