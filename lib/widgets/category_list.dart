import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/model/category.dart';

class CategoryList extends StatefulWidget {
  Category category;
  CategoryList({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        margin: const EdgeInsets.only(left: 15.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 3.0),
              child: Image.asset(
                widget.category.image,
                height: 30.0,
                width: 30.0,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              widget.category.name,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: kDarkGreyFontColor),
            )
          ],
        ));
  }
}
