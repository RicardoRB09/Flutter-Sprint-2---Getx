import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy Car", 10));
    entries.add(Product(1, "Toy House", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    // TODO
    // calcular el valor total de los elementos en el carro de compras
    // print('Product 1 total --> ${entries[0].quantity * entries[0].price}');
    // print('Product 2 total --> ${entries[1].quantity * entries[1].price}');

    for (var element in entries) {
      newTotal += (element.quantity * element.price);
    }

    total.value = newTotal;
    // print('Total value --> ${total.value}');
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // TODO -- OK
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    var product = entries.firstWhere((element) => element.id == id);
    // print('Item--> ${product.id}');

    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    var index = entries.indexOf(product);

    // después hacer el incremento en la cantidad
    product.quantity++;

    // finalmente actualizar entries usando el indice y el elemento actualizado
    entries[index].quantity = product.quantity;
    entries.refresh();
    print('Sumar 1 --> ${entries[index].quantity}');
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO - OK
    // similar a agregarProducto
    var product = entries.firstWhere((element) => element.id == id);
    // print('Item--> ${product.id}');

    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    var index = entries.indexOf(product);

    // después hacer el incremento en la cantidad
    // validar cuando la cantidad es igual a cero
    if (product.quantity > 0) {
      product.quantity--;
    }

    // finalmente actualizar entries usando el indice y el elemento actualizado
    entries[index].quantity = product.quantity;
    entries.refresh();
    print('Restar --> ${entries[index].quantity}');

    calcularTotal();
  }
}
