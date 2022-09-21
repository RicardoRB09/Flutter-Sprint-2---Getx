import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class CartTotal extends StatelessWidget {
  final ShoppingController shoppingController = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        //TODO -- OK
        // Aquí se observa la variable total del shoppingController
        child: Obx(
          () => Text(
            'Total: ${shoppingController.total} USD',
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
