import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_kasir/controllers/cashier_controller.dart';
import 'package:uas_kasir/styles/text_styles.dart';
import 'package:uas_kasir/widgets/custom_textfield.dart';

class DialogTambah extends StatelessWidget {
  final CashierController cashierController;
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemCount = TextEditingController();
  final TextEditingController itemPrice = TextEditingController();

  DialogTambah({super.key, required this.cashierController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Tambah Item"),
      content: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 225,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: itemName,
                title: 'Nama Barang',
                icon: Icons.shopping_basket_outlined,
                isObscure: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: itemCount,
                title: 'Jumlah Barang',
                icon: Icons.shopping_basket_outlined,
                isObscure: false,
                isNumber: true,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: itemPrice,
                title: 'Harga Barang',
                icon: Icons.shopping_basket_outlined,
                isObscure: false,
                isNumber: true,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            cashierController.addItem(itemName.text, int.parse(itemCount.text),
                int.parse(itemPrice.text));
          },
          child: Text("Add Item"),
        ),
      ],
    );
  }
}
