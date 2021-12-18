import 'package:flutter/material.dart';
import 'package:food_app/constants/color.dart';
import 'package:food_app/constants/font_style.dart';
import 'package:food_app/model/cart.dart';
import 'package:food_app/view_models/cart_view_model.dart';
import 'package:provider/provider.dart';

class TabCart extends StatelessWidget {
  static const routeName = '/TabCart';
  const TabCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartViewModel cart = context.watch<CartViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kDartColor,
            )),
        title: Column(
          children: [
            const Text(
              'Your Cart',
              style: textDark,
            ),
            Text('${cart.totalCart} items', style: paragraph)
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Dismissible(
              key: ValueKey(cart.carts.elementAt(index)),
              onDismissed: (DismissDirection direction) => context.read<CartViewModel>().removeCart(cart.carts.elementAt(index)),
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  children: [Spacer(), Image.asset('assets/images/delete.png')],
                ),
              ),
              child: _buildCartItem(context, cart.carts.elementAt(index))),
        ),
        itemCount: cart.carts.length,
      ),
      bottomNavigationBar: buildCheckOut(context),
    );
  }
}

Widget _buildCartItem(BuildContext context, Cart cart) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      children: [
        SizedBox(
          width: 80,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: kDartColor, borderRadius: BorderRadius.circular(15.0)),
              child: Image.asset(cart.product.image.toString()),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.name.toString(),
              style: textDarkLight,
              maxLines: 2,
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(
                  child: Text(
                    '${cart.product.price} \$',
                    style: textDark,
                  )
                ),
                const SizedBox(width: 80),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.read<CartViewModel>().updateCart(cart, false), 
                      icon: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: kBackground,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: const Icon(Icons.remove)
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text('${cart.quantity}', style: textDark),
                    const SizedBox(width: 7),
                    IconButton(
                      onPressed: () => context.read<CartViewModel>().updateCart(cart, true), 
                      icon: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: kBackground,
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: const Icon(Icons.add))
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ]
    )
  );
}

Widget buildCheckOut(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(30.0),
    height: 200,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15))
        ]),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: kLightFontColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Icon(
                Icons.receipt,
                color: kPrimaryColor,
              ),
            ),
            const Spacer(),
            const Text(
              "Add voucher code",
              style: TextStyle(
                  fontSize: 16,
                  color: kDarkGreyFontColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: kDartColor,
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(TextSpan(
              text: "Total: \n\n",
              style: textDark,
              children: [TextSpan(text: '\$ ${context.read<CartViewModel>().totalPrice.toStringAsFixed(3)}', style: price)])),
            Container(
              width: 190,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30.0)),
              child: const Text(
                'Check Out',
                style: textDark,
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    ),
  );
}
