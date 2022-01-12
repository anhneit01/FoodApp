import 'package:flutter/material.dart';
import 'package:food_app/src/screens/auth/sign_in_screen.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/screens/search/search_screen.dart';
import 'package:food_app/src/screens/splash/splash_widget.dart';
import 'package:food_app/src/screens/tab_cart.dart';
import 'package:food_app/src/screens/chat/tab_chat.dart';

final Map<String, WidgetBuilder> routes = {
  SplashWidget.routeName: (context) => const SplashWidget(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailScreen.routeName: (context) => const DetailScreen(),
  TabChat.routeName: (context) => const TabChat(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  TabCart.routeName: (context) => const TabCart(),
};