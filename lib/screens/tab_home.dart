import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/model/category.dart';
import 'package:food_app/widgets/carousel_banner.dart';
import 'package:food_app/widgets/category_list.dart';
import 'package:food_app/widgets/category_title.dart';
import 'package:food_app/widgets/product/product_grid.dart';
import 'package:food_app/widgets/product/product_list.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
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
            CategoryTitle(content: 'Recommended for you'),
            const ProductGrid(),
            CategoryTitle(content: 'Meal Category'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Category.DATA_CATEGORIES.map((eachCategory) => CategoryList(category: eachCategory)).toList(),
              ),
            ),
            const ProductList()
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
      padding: const EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/ic_bell.png',
                color: kDartColor,
              ))
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
