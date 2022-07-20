
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/colors.dart';
import '../../core/values/languages/translations.dart';
import '../../core/values/text_style.dart';
import '../../routes/routes.dart';
import '../module/home/controller.dart';
import 'dart:developer' as d;

class MenuDrawer extends GetView<HomeController> {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg_menu.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: DrawerHeader(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const InkWell(child: SizedBox()),
                      const Spacer(),
                      SizedBox(
                        height: 304.0 / 4,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/logo.jpg",
                                height: 304.0 / 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Name", style: styleNameApp),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          ListTile(
            leading: const Icon(
              Icons.currency_bitcoin,
              color: AppColors.color,
              size: 36,
            ),
            title: const Text("Future", style: styleMenu),
            onTap: () async {
              Get.offAndToNamed(Routes.FUTURE);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: AppColors.color,
              size: 36,
            ),
            title: Text(AppTranslations.settings, style: styleMenu),
            onTap: () async {
              Get.offAndToNamed(Routes.SETTINGS);
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
    // });
  }
}
