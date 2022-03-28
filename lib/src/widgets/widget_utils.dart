import 'package:flutter/material.dart';

import '../../theme/color.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Function? leftCall;
  const AppIcon({ Key? key, required this.icon, this.leftCall }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: leftCall != null ? () => leftCall!() : null,
      child: Container(
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
            icon,
            size: 24.0,
            color: kDarkGreyColor,
          ),
        ),
      ),
    );
  }
}