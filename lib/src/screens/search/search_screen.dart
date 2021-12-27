import 'package:flutter/material.dart';
import 'package:food_app/src/model/product.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/view_models/product_view_model.dart';
import 'package:food_app/src/widgets/product/product_widget.dart';
import 'package:food_app/src/widgets/shimmer/shimmer_screen.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends StatefulWidget{
  static const routeName = '/SearchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with ProductWidget, ShimmerScreen{
  List<Product> products = [];
  List<Product> productDisplay = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    setLoading();
  }

  setLoading() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {});
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      backgroundColor: kWhiteColor,
      body: ChangeNotifierProvider<ProductViewModel>(
      create: (_) => ProductViewModel(),
      child: Consumer<ProductViewModel>(builder: (context, product, child) {
        return SmartRefresher(
          enablePullUp: true,
          enablePullDown: true,
          controller: product.refreshController,
          onLoading: product.onLoading,
          onRefresh: product.onRefresh,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return isLoading ? 
                buildProductListShimmer(context, kLightWhiteColor.withOpacity(0.3), MediaQuery.of(context).size.width)
                : Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, DetailScreen.routeName),
                    child: buildProductItemList(context, product.allProducts.elementAt(index), kLightWhiteColor.withOpacity(0.3), MediaQuery.of(context).size.width, nameDark),
                  ),
              );
            },
            itemCount: product.allProducts.length,
          ),
        );
      },)
    )
    );
  }
}

class SearchAppBar extends StatelessWidget implements PreferredSize {
  const SearchAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: kDarkGreyColor,
            )
          ),
          hintText: 'Search....',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.clear),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: kBottomColor,
            )
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

