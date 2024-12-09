import 'package:get/get.dart';
import 'package:uas_kasir/models/item.dart';

class CashierController extends GetxController {
  RxList<Item> pesanan = <Item>[].obs;

  RxInt sum = 0.obs;

  void addItem(String name, int count, int price) {
    pesanan.add(Item(name: name, count: count, price: price));
    sum += (count * price);
    update();
  }
}
