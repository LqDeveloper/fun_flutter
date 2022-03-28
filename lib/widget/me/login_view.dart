import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:fun_flutter/widget/me/header_bg_widget.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close)),
        ),
        body: Stack(
          children: [
            HeaderBgWidget(
              aspectRatio: 2.2,
              child: Align(
                alignment: const Alignment(0, -1),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/user_avatar.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.4),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Card(
                  child: LoginCardView(),
                ),
              ),
            )
          ],
        ));
  }
}

class LoginCardView extends StatelessWidget {
  const LoginCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GetBuilder<LoginLogic>(builder: (logic) {
        return Form(
          child: Column(
            children: [
              TextFormField(
                style: ThemeManager.style(fontSize: 14),
                decoration: InputDecoration(
                    hintText: "user_name".tr,
                    prefixIcon: const Icon(Icons.verified_user)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "user_name_not_empty".tr;
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  logic.userName = value ?? "";
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                style: ThemeManager.style(fontSize: 14),
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "password".tr,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: const Icon(Icons.remove_red_eye)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "pwd_not_empty".tr;
                  } else {
                    return value.length >= 6 ? null : 'pwd_at_least_6'.tr;
                  }
                },
                onSaved: (value) {
                  logic.password = value ?? "";
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 230,
                height: 40,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Sign_In".tr,
                      style: ThemeManager.style(
                          fontSize: 20, color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Get.theme.primaryColor),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutePath.register);
                },
                child: RichText(
                    text: TextSpan(
                        style: ThemeManager.style(
                            color: ThemeManager.bgColor(), fontSize: 12),
                        children: [
                      TextSpan(text: "not_has_account".tr),
                      TextSpan(
                          text: "go_register".tr,
                          style: ThemeManager.style(
                              color: Get.theme.primaryColor, fontSize: 12))
                    ])),
              )
            ],
          ),
        );
      }),
    );
  }
}
