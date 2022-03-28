import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/theme_manager.dart';
import 'package:get/get.dart';

import 'header_bg_widget.dart';
import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                height: 320,
                child: Card(
                  child: RegisterCardView(),
                ),
              ),
            )
          ],
        ));
  }
}

class RegisterCardView extends StatelessWidget {
  const RegisterCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GetBuilder<RegisterLogic>(builder: (logic) {
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
                  logic.confirmPwd = value ?? "";
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
                  child: Text("Sign_up".tr,
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
            ],
          ),
        );
      }),
    );
  }
}
