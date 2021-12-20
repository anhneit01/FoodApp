import 'package:flutter/material.dart';
import 'package:food_app/src/model/category.dart';
import 'package:food_app/src/widgets/category/category_item.dart';

class CustomTabCategory extends StatelessWidget {
  final List<Category> categories;
  final Function onTap;
  final int currentCate;

  const CustomTabCategory({ Key? key, required this.onTap, required this.currentCate, required this.categories }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: categories.elementAt(index), 
                  selected: categories[index].id == currentCate, 
                  onTap: onTap
                );
              }, 
              separatorBuilder: (context, index) => const SizedBox(width: 50.0,), 
              itemCount: categories.length
            ),
          ),
        )
      ],
    );
  }
}