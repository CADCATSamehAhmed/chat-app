import 'package:flutter/material.dart';
import 'package:mini_chat/core/widget/build_custom_divider.dart';
import 'package:mini_chat/core/widget/default_text_form.dart';

/*************  ✨ Codeium Command ⭐  *************/
/// A form for the register screen.
///
/// This form includes fields for name, email, phone and password.
///
/// The [name] field is a text field with the label 'enter your name'.
///
/// The [email] field is an email address field with the label 'enter your email'.
///
/// The [phone] field is a number field with the label 'enter your phone'.
///
/// The [password] field is a password field with the label 'enter your password'.
///
/// The [isObscure] parameter determines whether the password should be obscured.
///
/// The [onTap] parameter is the callback when the suffix icon of the password field is tapped.
///
/// The [nameValidate], [emailValidate], [phoneValidate] and [passValidate] parameters are the validation callbacks for the respective fields.
///
/// The returned widget is a [Form] widget with all the fields inside a [Column].
///
/// The [mainAxisAlignment] of the [Column] is set to [MainAxisAlignment.center].
///
/// The [crossAxisAlignment] of the [Column] is set to [CrossAxisAlignment.center].
///
/// The [children] of the [Column] are the fields and [buildCustomDivider] widgets.
///
/// ****  8954e0f7-16c2-43e7-87ea-8ed6e83dcc08  ******
Form buildRegisterForm({
  required BuildContext context,
  required dynamic email,
  required dynamic name,
  required dynamic phone,
  required dynamic password,
  required bool isObscure,
  void Function()? onTap,
  required String? Function(String? v) emailValidate,
  required String? Function(String? v) passValidate,
  required String? Function(String? v) nameValidate,
  required String? Function(String? v) phoneValidate,
  required Key? registerFormKey,
}) {
  return Form(
    key: registerFormKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        defaultTextForm(
          label: 'enter your name',
          textInputType: TextInputType.text,
          controller: name,
          iconData: Icons.person,
          onValidate: nameValidate,
        ),
        buildCustomDivider(context),
        defaultTextForm(
          label: 'enter your email',
          textInputType: TextInputType.emailAddress,
          controller: email,
          iconData: Icons.email,
          onValidate: emailValidate,
        ),
        buildCustomDivider(context),
        defaultTextForm(
          label: 'enter your phone',
          textInputType: TextInputType.number,
          controller: phone,
          iconData: Icons.phone,
          onValidate: phoneValidate,
        ),
        buildCustomDivider(context),
        defaultTextForm(
          label: 'enter your password',
          onValidate: passValidate,
          textInputType: TextInputType.text,
          controller: password,
          iconData: Icons.lock,
          obscureText: isObscure,
          onTap: onTap,
          isSuffix: true,
        ),
      ],
    ),
  );
}
