import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  
  const ShimmerWidget.rectangular({
    this.width = double.infinity, 
    required this.height}) : shapeBorder = const RoundedRectangleBorder();
  
  const ShimmerWidget.circular(
    { Key? key, 
    required this.width, 
    required this.height, 
    this.shapeBorder = const CircleBorder()}
  ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[400],
          shape: shapeBorder
        ),
      ),
    );
  }
}