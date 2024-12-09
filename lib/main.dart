import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:uas_kasir/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UAS Keenan',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: appRoutes.routes,
    );
  }
}
