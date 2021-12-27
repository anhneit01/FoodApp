import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/screens/search/search_screen.dart';
import 'package:food_app/src/screens/tab_cart.dart';
import 'package:food_app/src/screens/tab_chat.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
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
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/HomeScreen' : (context) => const HomeScreen(),
        '/DetailScreen' : (context) => const DetailScreen(),
        '/TabCart' : (context) => const TabCart(),
        '/TabChat' : (context) => const TabChat(),
        '/SearchScreen' : (context) => const SearchScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Assistant',
      ),
      home: const HomeScreen(),
    ),
    );
  }
}