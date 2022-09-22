import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            // TODO -- OK
            // aquí debemos rodear el widget Expanded en un Obx para
            // observar los cambios en la lista de entries del shoppingController
            Obx(
              () => Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: shoppingController.entries.length,
                  itemBuilder: (context, index) {
                    return _row(shoppingController.entries[index], index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product, index);
  }

  Widget _card(Product product, int index) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('${product.price.toString()} USD'),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  // TODO -- OK
                  // aquí debemos llamar al método del controlador que
                  // incrementa el número de unidades del producto
                  // pasandole el product.id
                  print(product.quantity);
                  shoppingController.agregarProducto(product.id);
                },
                icon: const Icon(Icons.arrow_upward),
              ),
              IconButton(
                onPressed: () {
                  // TODO -- OK
                  // aquí debemos llamar al método del controlador que
                  // disminuye el número de unidades del producto
                  // pasandole el product.id
                  print(product.quantity);
                  shoppingController.quitarProducto(product.id);
                },
                icon: const Icon(Icons.arrow_downward),
              )
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Quantity"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Text(
                    '${shoppingController.entries[index].quantity}',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
