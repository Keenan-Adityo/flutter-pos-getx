import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_kasir/controllers/login_controller.dart';
import 'package:uas_kasir/styles/text_styles.dart';
import 'package:uas_kasir/widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg1.jpeg"), fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Center(
                        child: Text(
                          "Kasir Keenan",
                          style: kTitle,
                        ),
                      ),
                      const Spacer(),
                      CustomTextField(
                        controller: username,
                        title: 'username',
                        icon: Icons.person_4_rounded,
                        isObscure: false,
                      ),
                      const Spacer(),
                      CustomTextField(
                        controller: password,
                        title: 'password',
                        icon: Icons.lock,
                        isObscure: true,
                      ),
                      const Spacer(),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black),
                          ),
                          onPressed: () {
                            loginController.login(username.text, password.text);
                          },
                          child: Text(
                            "Masuk",
                            style: kSubTitle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
