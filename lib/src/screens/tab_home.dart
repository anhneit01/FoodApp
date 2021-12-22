import 'package:flutter/material.dart';
import 'package:food_app/src/model/category.dart';
import 'package:food_app/src/screens/search/search_screen.dart';
import 'package:food_app/src/widgets/carousel_banner.dart';
import 'package:food_app/src/widgets/category/category_list.dart';
import 'package:food_app/src/widgets/category_title.dart';
import 'package:food_app/src/widgets/product/product_grid.dart';
import 'package:food_app/src/widgets/product/product_list.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  int selected = 0;
  List<Category> categories = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const _CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselBanner(),
            const SizedBox(height: 20.0),
            CategoryTitle(content: 'Recommended for you'),
            const ProductList(),
            const SizedBox(height: 20.0),
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
            const SizedBox(height: 20.0),
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
      padding: const EdgeInsets.only(left: 5, right: 15.0, top: 15.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.arrow_back_ios_new_rounded)
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: kBottomColor,
            backgroundImage: AssetImage('assets/images/avata.png'),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}


// IconButton(
//                 onPressed: () => Navigator.pushNamed(context, TabCart.routeName),
//                 icon: Container(
//                   decoration: const BoxDecoration(
//                     color: kBottomColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                       child: Text(
//                     context.watch<CartViewModel>().totalCart.toString(),
//                     style: nameLight,
//                   )),
//                 ),
//               ),