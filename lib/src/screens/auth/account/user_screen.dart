import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/custom_appbar.dart';

import '../../home_screen.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/UserScreen';
  const UserScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leftIcon: Icons.arrow_back_ios_new_rounded,
        rightIcon: Icons.more_vert_outlined,
        leftCallback: () => Navigator.of(context).popAndPushNamed(HomeScreen.routeName),
      ),
    );
  }

  Widget getBody() {
    return ListView(
    );
  }

  Widget editAccount() {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
          )
        ],
      ),
    );
  }
}

