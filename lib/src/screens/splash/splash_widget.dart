import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/screens/auth/sign_in_screen.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/view_models/auth/auth_view_model.dart';
import 'package:provider/src/provider.dart';

class SplashWidget extends StatefulWidget {
  static const routeName = '/SplashWidget';
  const SplashWidget({ Key? key }) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  AuthViewModel auth = AuthViewModel();
  @override
  void initState() {
    super.initState();
    auth = context.read<AuthViewModel>();
    WidgetsBinding.instance?.addPostFrameCallback((_) => tryLogin(context));
  }

  Future<void> tryLogin(BuildContext context) async {
    await auth.tryLogin();
    if(auth.isLogin){
      Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(SignInScreen.routeName, (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/ic_logo.gif'),
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: const SignInScreen(),
      duration: 4000,
    );
  }
}
