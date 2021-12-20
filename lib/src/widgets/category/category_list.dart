import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/src/view_models/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  final int selected;
  Function callback;
  CategoryList({Key? key, required this.selected, required this.callback}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryViewModel category = CategoryViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryViewModel>(
      create: (_) => CategoryViewModel(),
      child: Consumer<CategoryViewModel>(
        builder: (context, category, child) {
          return SizedBox(
            height: 60,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => widget.callback(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.selected == index ? kPrimaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                    margin: const EdgeInsets.only(left: 15.0),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: Image.asset(
                            category.allCategories.elementAt(index).image.toString(),
                            height: 30.0,
                            width: 30.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          category.allCategories.elementAt(index).name.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kLightGreyColor),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: category.allCategories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
            ),
          );
        },
      ),
    );
  }
}
