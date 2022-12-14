import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';
import '../Widgets/cart_total.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              buildProfileImage(),
              customAppBar(),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text("Group 7 Toy Store",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Do you want it? You GOT IT!",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300),
          ),
          CartTotal(),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          radius: 73,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 70.0,
            backgroundColor: Colors.white,
            child: SizedBox(
              width: 90,
              child: Image(
                image: AssetImage("assets/images/logo_construction.png"),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(
              () => const ProductList(),
              transition: Transition.cupertino,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeIn,
            ),
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
