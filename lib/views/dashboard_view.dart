import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_kasir/controllers/login_controller.dart';
import 'package:uas_kasir/styles/text_styles.dart';
import 'package:uas_kasir/widgets/chart.dart';
import 'package:uas_kasir/widgets/custom_drawer.dart';

class DashboardView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Text(
            "Total Penjualan Minggu ini",
            style: kSubTitle,
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 1,
                    offset: Offset(1, 2),
                  ),
                ],
                border: Border.all(),
                color: ThemeData().scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Chart(),
          ),
          Text(
            "Jumlah Transaksi Minggu ini : 86",
            style: kSubTitle,
          ),
        ],
      ),
    );
  }
}
