import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function? leftCallback;

  const CustomAppbar(
      {Key? key,
      required this.leftIcon,
      required this.rightIcon,
      this.leftCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: newMethod(),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14.0)),
            child: Icon(
              rightIcon,
              size: 24.0,
              color: kDartColor,
            ),
          )
        ],
      ),
    );
  }

  Container newMethod() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14.0)),
      child: Icon(
        leftIcon,
        size: 24.0,
        color: kDartColor,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
