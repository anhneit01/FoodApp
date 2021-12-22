import 'package:flutter/material.dart';
import 'package:food_app/src/model/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool selected;
  final Function onTap;
  const CategoryItem(
      {Key? key,
      required this.category,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap(category.id);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          margin: const EdgeInsets.only(left: 15.0),
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 3.0),
                child: Image.asset(
                  category.image.toString(),
                  height: 30.0,
                  width: 30.0,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                category.name.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,),
              )
            ],
          ),
        ));
  }
}
