import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/screens/detail.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/onboard_screen.dart';
import 'package:food_app/screens/product.dart';
import 'package:food_app/screens/tab_cart.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/HomeScreen' : (context) => const HomeScreen(),
        '/DetailScreen' : (context) => const DetailScreen(),
        '/ProductScreen' : (context) => const ProductScreen(),
        '/TabCart' : (context) => const TabCart(),
      },
      theme: ThemeData(
        fontFamily: 'Readex_Pro',
      ),
      home: const OnboardScreen(),
    );
  }
}