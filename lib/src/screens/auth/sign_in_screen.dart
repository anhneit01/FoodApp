// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_app/src/screens/base/base_view.dart';
import 'package:food_app/src/view_models/auth/auth_form_view_model.dart';
import 'package:food_app/src/view_models/auth/auth_view_model.dart';
import 'package:food_app/src/widgets/custom_appbar.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:food_app/theme/theme.dart';
import 'package:provider/src/provider.dart';

import '../home_screen.dart';

class SignInScreen extends StatelessWidget{
  static const routeName = '/SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(
        rightIcon: Icons.more_vert_outlined,
        text: 'Sign In',
        smallText: 'Do you have account?',
      ),
      body: BaseView<AuthFormViewModel>(
        model: AuthFormViewModel(),
        builder: (context, auth, child) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  signInfor(context, 'Welcome Back',
                      'Pizza, dish of topped with some baked quickly—usually,'),
                  const Spacer(),
                  Column(
                    children: [
                      TextField(
                        obscureText: false,
                        controller: auth.emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          labelText: "Email",
                          errorText: auth.email.error,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: customSuffixIcon(const Icon(Icons.email_outlined))
                        ),
                        onChanged: (String value) {
                          auth.changeEmail(value);
                        },
                      ),
                      const SizedBox(height: 30.0),
                      TextField(
                        obscureText: auth.obscureText,
                        controller: auth.passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          labelText: "Password",
                          errorText: auth.password.error,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: GestureDetector(
                            onTap: auth.passwordToggle,
                            child: customSuffixIcon(auth.obscureText ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined)),
                          ) 
                        ),
                        onChanged: (String value) {
                          auth.changePassword(value);
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            fontSize: 17,
                            color: kDarkGreyColor.withOpacity(0.6),
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            color: kDarkGreyColor.withOpacity(0.6),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: (!auth.isValid) ? null : auth.submit ,
                      child: Text('Sign In'.toUpperCase(),
                          style: titleDark),
                      color: kPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                          icon: 'assets/images/ic_google.png',
                          press: () {}),
                      SocialCard(
                          icon: 'assets/images/ic_meta.png',
                          press: () {}),
                      SocialCard(
                          icon: 'assets/images/ic_insta.png',
                          press: () {}),
                    ],
                  ),
                  const Spacer(flex: 5,)
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

Widget signInfor(BuildContext context, String titleText, String description) =>
    Column(
      children: [
        Text(
          titleText,
          style: header,
        ),
        const SizedBox(height: 5.0),
        Text(
          description,
          style: TextStyle(
              fontSize: 15,
              color: kDarkGreyColor.withOpacity(0.3),
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        )
      ],
    );

Widget customSuffixIcon(Widget suffixIcon) => Padding(
  padding: const EdgeInsets.fromLTRB(0, 20.0, 20.0, 20.0),
  child: suffixIcon,
);