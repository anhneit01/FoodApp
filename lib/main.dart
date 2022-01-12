import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/routs.dart';
import 'package:food_app/src/screens/auth/sign_in_screen.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/screens/splash/splash_widget.dart';
import 'package:food_app/src/view_models/auth/auth_view_model.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
import 'package:food_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const FoodApp());
}

class FoodApp extends StatefulWidget {
  const FoodApp({ Key? key }) : super(key: key);

  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartViewModel>(create: (_) => CartViewModel()),
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
      home: const SplashWidget()
    ),
    );
  }
}