import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/widget_utils.dart';

import '../../../theme/color.dart';
import '../../../theme/font_style.dart';
import '../../screens/detail.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 10.0, left: 30.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: kWhiteColor),
                  child: const Text(
                    'Pizza Test Better',
                    style: titleDark,
                  ),
                ),
                preferredSize: const Size.fromHeight(20.0)),
            toolbarHeight: 80.0,
            pinned: true,
            backgroundColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios_new_rounded),
                AppIcon(icon: Icons.favorite)
              ],
            ),
            elevation: 0.0,
            expandedHeight: 300.0,
            flexibleSpace: const FlexibleSpaceBar(
              background: BuildImageDetail(),
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildIconText(Icons.access_time_outlined, Colors.blue, '60 Min'),
                    buildIconText(Icons.star_outlined, Colors.amber, '5'),
                    buildIconText(Icons.local_fire_department, Colors.red, '50 Min')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          )
        ),
      )
    );
  }
}

class BuildImageDetail extends StatelessWidget {
  const BuildImageDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/shape.png',
          fit: BoxFit.fill,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(15.0),
            width: 250.0,
            height: 250.0,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(-1, 10),
                blurRadius: 10,
              )
            ]),
            child: Image.asset(
              'assets/images/bugger(1).png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
