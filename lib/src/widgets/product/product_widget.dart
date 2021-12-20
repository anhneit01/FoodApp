import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/src/model/product.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
import 'package:provider/provider.dart';

class ProductWidget {
  Widget buildProductItemList(BuildContext context, Product product) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 300.0,
      decoration: BoxDecoration(
        color: kDarkGreyColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              product.image.toString(),
              width: 100,
              height: 100,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          product.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: nameProductWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  product.desc.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: paragraph,
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "${product.price.toString()} \$",
                        style: price,
                      ),
                    ),
                    GestureDetector(
                        onTap: () =>
                            context.read<CartViewModel>().addToCart(product),
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: const BoxDecoration(
                              color: kBackground, shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/images/ic_cart.png',
                            width: 25,
                            height: 25,
                            color: kDartColor,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildProductItemGrid(BuildContext context, Product product) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      width: 170.0,
      height: 200.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              product.image.toString(),
              width: 90,
              height: 90,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: Text(
              product.name.toString(),
              style: nameProductDark,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              num.parse(product.ratings.toString()).toInt(),
              (index) => Image.asset('assets/images/ic_fillstar.png', width: 15)
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${product.duration.toString()} \nMin',
                style: paragraph,
                textAlign: TextAlign.center,
              ),
              Column(
                children: List.generate(
                  12,
                  (index) => Container(
                    width: 1.0,
                    height: 1.0,
                    color: kDarkGreyFontColor,
                  )
                ),
              ),
              const Text(
                'Hard \nLvl',
                style: paragraph,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}
