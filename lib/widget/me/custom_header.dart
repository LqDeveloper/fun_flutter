import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/app_route.dart';
import 'package:get/get.dart';

import 'header_bg_widget.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderBgWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/user_avatar.png",
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(RoutePath.login);
                },
                child: Text(
                  "click_login".tr,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
