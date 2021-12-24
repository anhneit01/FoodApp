import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_widget.dart';
class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return buildProductListShimmer();
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductListShimmer() => const ListTile(
    leading: ShimmerWidget.circular(
      width: 64, 
      height: 64
    ),
    title: ShimmerWidget.rectangular(height: 16),
    subtitle: ShimmerWidget.rectangular(height: 14),
  );
}
