import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/src/model/category.dart';
import 'package:food_app/src/screens/tab_cart.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
import 'package:food_app/src/widgets/carousel_banner.dart';
import 'package:food_app/src/widgets/category/category_list.dart';
import 'package:food_app/src/widgets/category_title.dart';
import 'package:food_app/src/widgets/product/product_grid.dart';
import 'package:food_app/src/widgets/product/product_list.dart';
import 'package:provider/provider.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  int selected = 0;
  final pageController = PageController();
  List<Category> categories = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: const _CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselBanner(),
            const SizedBox(height: 30.0),
            CategoryTitle(content: 'Recommended for you'),
            const ProductList(),
            const SizedBox(height: 30.0),
            CategoryTitle(content: 'Meal Category'),
            const SizedBox(height: 15.0),
            CategoryList(
              selected: selected,
              callback: (int index) {
                setState(() {
                  selected = index;
                });
              },
            ),
            const SizedBox(height: 30.0),
            const ProductGrid()
          ],
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSize {
  const _CustomAppbar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Expanded(
                child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                  prefixIcon: Image.asset(
                    'assets/images/ic_search.png',
                    color: kDartColor,
                  ),
                  hintText: 'Search hear....',
                  hintStyle: paragraph),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/ic_bell.png')),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, TabCart.routeName),
                child: Stack(
                  children: [
                    Image.asset('assets/images/ic_cart.png',
                        color: kDartColor, width: 40, height: 40),
                    Positioned(
                      top: -1,
                      right: -1,
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(context
                            .watch<CartViewModel>()
                            .totalCart
                            .toString()),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
