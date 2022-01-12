import 'package:flutter/material.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String? text;
  final String? smallText;
  final Function? leftCallback;

  const CustomAppbar(
      {Key? key,
      this.leftIcon,
      this.rightIcon,
      this.leftCallback,
      this.text,
      this.smallText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: newMethod(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text ?? '',
                  style: titleDark,
                ),
                Text(smallText ?? '', style: paragraphDark)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2.0,
                  blurRadius: 10.0,
                )
              ],
            ),
            child: Center(
              child: Icon(
                // ignore: unnecessary_null_in_if_null_operators
                rightIcon,
                size: 24.0,
                color: kDarkGreyColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container newMethod() {
    if (leftIcon == null) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: const SizedBox(
          width: 10,
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: kWhiteColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2.0,
              blurRadius: 10.0,
            )
          ],
        ),
        child: Center(
          child: Icon(
            leftIcon,
            size: 24.0,
            color: kDarkGreyColor,
          ),
        ),
      );
    }
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
