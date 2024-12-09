import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_kasir/controllers/cashier_controller.dart';
import 'package:uas_kasir/controllers/login_controller.dart';
import 'package:uas_kasir/styles/text_styles.dart';
import 'package:uas_kasir/widgets/custom_drawer.dart';
import 'package:uas_kasir/widgets/dialog_tambah.dart';
import 'package:uas_kasir/widgets/horizontal_line.dart';

class CashierView extends StatelessWidget {
  final CashierController cashierController = Get.put(CashierController());
  CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cashier"),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: GetBuilder<CashierController>(builder: (_) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blue[900])),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogTambah(
                          cashierController: cashierController,
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Tambah Item",
                      textAlign: TextAlign.center,
                      style: kSubTitle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              cashierController.pesanan.isNotEmpty
                  ? CashierBill(cashierController: cashierController)
                  : SizedBox(),
              cashierController.pesanan.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Selesaikan Transaksi"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Get.snackbar(
                                          "Transaksi Berhasil Diselesaikan",
                                          "Transaksi berhasil diselesaikan dengan baik!");
                                    },
                                    child: Text("Selesaikan"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Selesaikan Transaksi",
                            textAlign: TextAlign.center,
                            style: kSubTitle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          );
        }),
      ),
    );
  }
}

class CashierBill extends StatelessWidget {
  const CashierBill({
    super.key,
    required this.cashierController,
  });

  final CashierController cashierController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashierController>(builder: (_) {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 1,
                offset: Offset(1, 2),
              ),
            ],
            color: ThemeData().scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(
              "Pesanan",
              style: kSubTitle,
            ),
            HorizontalLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cashierController.pesanan.length,
                    itemBuilder: (context, index) => Text(
                      cashierController.pesanan[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: kText,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cashierController.pesanan.length,
                    itemBuilder: (context, index) => Text(
                      "${cashierController.pesanan[index].count} pcs x Rp.${cashierController.pesanan[index].price}",
                      style: kText,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
            HorizontalLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jumlah",
                  style: kSubTitle,
                ),
                Text(
                  "Rp.${cashierController.sum}",
                  style: kSubTitle,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
