import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_widget.dart';
import 'package:food_app/theme/color.dart';

// class ShimmerScreen extends StatelessWidget {
//   const ShimmerScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       appBar: AppBar(
//         title: const Text('Shimmer '),
//       ),
//       body: StaggeredGridView.countBuilder(
//         crossAxisCount: 6,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10, 
//         itemBuilder: (BuildContext context, int index) { 
//           return GestureDetector(
//             onTap: () {},
//             child: buildProductGridShimmer(context),
//           );
//          }, 
//         staggeredTileBuilder: (index) => StaggeredTile.count(3, index.isEven ? 3.4 : 3.6),
//       )
//     );
//   }

class ShimmerScreen {
  
  Widget buildProductListShimmer(BuildContext context, Color bgColor, double width) {
    return Container(
      width: width,
      height: 160,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          const ShimmerWidget.circular(
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 10.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(
                height: 18,
                width: width * .45 ,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ShimmerWidget.rectangular(
                height: 15,
                width: width * .5,
              ),
            ],
          )
        ],
      ),
    );
  } 

  Widget buildProductGridShimmer(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: kWhiteColor,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2.0,
          blurRadius: 10.0,
        )
      ],
    ),
    width: 170.0,
    height: 220.0,
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const ShimmerWidget.circular(
          width: 90, 
          height: 90
        ),
        const ShimmerWidget.rectangular(
          width: 170 * .5, 
          height: 17
        ),
        const ShimmerWidget.rectangular(
          width: 170 * .8, 
          height: 15
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                ShimmerWidget.rectangular(
                  width: 170 ~/ 2 * .5, 
                  height: 10
                ),
                SizedBox(height: 5.0),
                ShimmerWidget.rectangular(
                  width: 170 ~/ 2 * .8, 
                  height: 10
                ),
              ]
            ),
            Column(
              children: const [
                ShimmerWidget.rectangular(
                  width: 170 ~/ 2 * .5, 
                  height: 8
                ),
                SizedBox(height: 5.0),
                ShimmerWidget.rectangular(
                  width: 170 ~/ 2 * .8, 
                  height: 8
                ),
              ]
            )
          ],
        )
      ],
    ),
  );
}
