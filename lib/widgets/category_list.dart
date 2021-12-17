import 'package:flutter/material.dart';
import 'package:food_app/api/category_api.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/model/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryApi.readCategoryData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text('${data.error}'));
        } else if (data.hasData) {
          var categories = data.data as List<Category>;
          return buildCategoryItem(context, categories);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildCategoryItem(BuildContext context, List<Category> categories) {
    return Container(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() {
              selected = index;
            }),
            child: Container(
              decoration: BoxDecoration(
                  color: selected == index ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Image.asset(
                      categories.elementAt(index).image.toString(),
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    categories.elementAt(index).name.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:
                            selected == index ? kDartColor : kDarkGreyFontColor),
                  )
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
