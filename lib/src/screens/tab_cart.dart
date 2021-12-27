import 'package:flutter/material.dart';
import 'package:food_app/src/model/cart.dart';
import 'package:food_app/src/screens/detail.dart';
import 'package:food_app/src/screens/home_screen.dart';
import 'package:food_app/src/view_models/cart_view_model.dart';
import 'package:food_app/src/widgets/custom_appbar.dart';
import 'package:food_app/theme/color.dart';
import 'package:food_app/theme/font_style.dart';
import 'package:provider/provider.dart';

class TabCart extends StatelessWidget {
  static const routeName = '/TabCart';
  const TabCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartViewModel cart = context.watch<CartViewModel>();
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CustomAppbar(
        leftIcon: Icons.arrow_back_ios_new_rounded,
        rightIcon: Icons.more_vert_outlined,
        leftCallback: () => Navigator.of(context).popAndPushNamed(HomeScreen.routeName),
        text: 'Your Cart',
        smallText: '${cart.totalCart.toString()} items',
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
  double width = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20.0),
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: kWhiteColor,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [ BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 2.0,
        blurRadius: 10.0,
      )],
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(15.0)
          ),
          width: 80,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Image.asset(cart.product.image.toString()),
          ),
        ),
        const SizedBox(width: 20.0),
        Row(
          children: [
            SizedBox(
              width: width * 1/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product.name.toString(),
                    maxLines: 2,
                    style: nameDark,
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      const Text('\$', style: currencyUnit),
                      SizedBox(
                        child: Text(
                          '${cart.product.price}',
                          style: price)
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () => context.read<CartViewModel>().updateCart(cart, false), 
                    icon: Container(
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0,
                          color: kLightGreyColor
                        )
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.remove, 
                          size: 20,
                          color: kLightGreyColor,
                        ),
                      )
                    ),
                  ),
                  Text('${cart.quantity}', style: nameDark,),
                  IconButton(
                    onPressed: () => context.read<CartViewModel>().updateCart(cart, true), 
                    icon: Container(
                      decoration: const BoxDecoration(
                        color: kBottomColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: kWhiteColor,
                        ),
                      )
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ]
    )
  );
}

Widget buildCheckOut(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    height: 250,
    decoration: const BoxDecoration(
      color: kWhiteColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal', style: nameDark,),
              Text('${context.watch<CartViewModel>().totalPrice.toStringAsFixed(3)} \$', style: titleDark)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Discount', style: nameDark,),
              Text('10%', style: TextStyle(
                fontSize: 22, color: Colors.red[600], fontWeight: FontWeight.w700
              ))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total (${context.watch<CartViewModel>().totalCart.toString()} items)', style: nameDark,),
              Text('${context.watch<CartViewModel>().totalPrice.toStringAsFixed(3)} \$', style: titleDark)
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: kBottomColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: Text(
            'Check Out'.toUpperCase(),
            textAlign: TextAlign.center,
            style: titleLight,
          ),
        )
      ],
    ),
  );
}
