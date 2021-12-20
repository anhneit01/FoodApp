import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/src/screens/tab_cart.dart';
import 'package:food_app/src/screens/tab_home.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> bottomTab = [
    const TabHome(),
    const TabHome(),
    const TabCart(),
    const TabHome(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDartColor,
      body: TabHome(),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: kBottomColor.withOpacity(0.9),
      //   elevation: 0.00,
      //   selectedItemColor: kPrimaryColor,
      //   unselectedItemColor: kDarkGreyFontColor,
      //   currentIndex: selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //   },
      //   items: [
      //     buildBottomNavigationBarItem('assets/images/ic_home.png', 0),
      //     buildBottomNavigationBarItem('assets/images/ic_user.png', 1),
      //     buildBottomNavigationBarItem('assets/images/ic_shopping-bag.png', 2),
      //     buildBottomNavigationBarItem('assets/images/ic_setting.png', 3),
      //   ],
      // ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String image, int index) {
    var bottomNavigationBarItem = BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
          child: Column(
            children: [
              ImageIcon(
                AssetImage(image),
                size: 32.0,
              ),
              Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? kPrimaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0)),
              )
            ],
          ),
        ),
        title: Text(' '));
    return bottomNavigationBarItem;
  }

}

