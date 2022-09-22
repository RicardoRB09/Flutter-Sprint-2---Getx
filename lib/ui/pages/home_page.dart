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
            height: 60,
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
      alignment: Alignment.bottomCenter,
      children: const [
        CustomBanner(200),
        CircleAvatar(
          backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/men/75.jpg"),
          radius: 60.0,
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
            onTap: () => Get.to(() => const ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(seconds: 1)),
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
