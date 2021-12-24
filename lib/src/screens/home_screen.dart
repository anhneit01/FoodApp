import 'package:flutter/material.dart';
import 'package:food_app/src/screens/search/search_screen.dart';
import 'package:food_app/src/screens/tab_cart.dart';
import 'package:food_app/src/screens/tab_home.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
import 'package:food_app/src/widgets/scroll_to_hide_widget.dart';
import 'package:food_app/theme/color.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController controller;
  List<Widget> bottomTab = [
    const TabHome(),
    const TabHome(),
    const SearchScreen(),
    const TabCart(),
    const TabHome(),
  ];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomTab.elementAt(selectedIndex),
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5, 
              color: kLightGreyColor.withOpacity(0.3)
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15))
            ]
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kLightWhiteColor,
            elevation: 0.00,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kLightWhiteColor,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              buildBottomNavigationBarItem('assets/images/ic_home.png', 0),
              buildBottomNavigationBarItem('assets/images/ic_chat.png', 1),
              buildBottomNavigationBarItem('assets/images/ic_search.png', 2),
              buildBottomNavigationBarItem('assets/images/ic_bag.png', 3, badge: context.watch<CartViewModel>().totalCart),
              buildBottomNavigationBarItem('assets/images/ic_user.png', 4),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String image, int index, {int badge = 0}) {
    var bottomNavigationBarItem = BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ImageIcon(
                    AssetImage(image),
                    color: selectedIndex == index ? kPrimaryColor : kBottomColor,
                    size: 25.0,
                  ),
                  index != 0 && index != 4 && index != 2 ? Positioned(
                    right: -15,
                    top: -10,
                    child: Container(
                      height: 24,
                      width: 24,
                      constraints: const BoxConstraints(
                        maxWidth: 45,
                        maxHeight: 45
                      ),
                      decoration: BoxDecoration(
                        color: selectedIndex == index ? kPrimaryColor : kBottomColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          badge.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: selectedIndex == index ? kBottomColor : kWhiteColor,
                          ),
                        ),
                      ),
                    )
                  ) : Container(child: SizedBox.shrink(),)
                ],
              ),
              
            ],
          ),
        ),
        title: Text(' '));
    return bottomNavigationBarItem;
  }
}
