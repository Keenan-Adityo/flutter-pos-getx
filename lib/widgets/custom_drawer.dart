import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_kasir/controllers/login_controller.dart';
import 'package:uas_kasir/styles/text_styles.dart';

class CustomDrawer extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sidebar Menu",
                    // route?.settings.name ?? "test",
                    style: kTitle,
                  ),
                  Spacer(),
                  Icon(Icons.view_sidebar_sharp),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SidebarMenuTile(
                onTap: () {
                  Get.toNamed('/dashboard');
                },
                icon: Icon(Icons.dashboard),
                title: 'Dashboard',
                active: route?.settings.name == '/dashboard',
              ),
              SizedBox(
                height: 20,
              ),
              SidebarMenuTile(
                onTap: () {
                  Get.toNamed('/cashier');
                },
                icon: Icon(Icons.shopping_basket_outlined),
                title: 'Kasir',
                active: route?.settings.name == '/cashier',
              ),
              SizedBox(
                height: 20,
              ),
              SidebarMenuTile(
                onTap: () {
                  loginController.logout();
                },
                icon: Icon(Icons.logout),
                title: 'Logout',
                active: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarMenuTile extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final String title;
  final bool active;
  const SidebarMenuTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: active
            ? BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              )
            : BoxDecoration(),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: kSubTitle.copyWith(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
