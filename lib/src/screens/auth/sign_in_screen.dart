// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_app/src/screens/auth/register.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/view_models/auth/auth_form_view_model.dart';

import '../../../theme/color.dart';
import '../../../theme/font_style.dart';
import '../base/base_view.dart';
import 'foget_password_screen.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthFormViewModel>(
        model: AuthFormViewModel(),
        builder: (context, auth, child) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/login_banner.png',
                      width: 300,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      signInfor(context, 'Login', 'Hello, welcome back to our account'),
                      const SizedBox(height: 20.0),
                      Column(
                        children: [
                          TextField(
                            obscureText: false,
                            controller: auth.emailController,
                            decoration: InputDecoration(
                                hintText: 'Enter your email',
                                labelText: "Email",
                                errorText: auth.email.error,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: customSuffixIcon(
                                    const Icon(Icons.alternate_email))),
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: GestureDetector(
                                  onTap: auth.passwordToggle,
                                  child: customSuffixIcon(auth
                                          .obscureText
                                      ? const Icon(Icons.remove_red_eye)
                                      : const Icon(Icons
                                          .remove_red_eye_outlined)),
                                )),
                            onChanged: (String value) {
                              auth.changePassword(value);
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, FogetPasswordScreen.routeName),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text('Forgot Password?', style: nameDark.copyWith(
                              fontSize: 17,
                              color: kBorderColor
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, HomeScreen.routeName)
                      }, 
                      child: Text(
                        'Sign In'.toUpperCase(),
                        style: titleDark,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                      ),
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have account ?", style: nameDark),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, RegisterScreen.routeName),
                          child: Text('Register', style: nameDark.copyWith(
                            color: Colors.red
                          )),
                        )
                      ],
                    )
                  ),
                  const Spacer()
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
    crossAxisAlignment: CrossAxisAlignment.start,
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
