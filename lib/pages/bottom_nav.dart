import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/navigation_controller.dart';
import 'package:pas1_mobile_11pplg2_23/controller/responsif_controller.dart';
import 'package:pas1_mobile_11pplg2_23/pages/page_menus/api_page.dart';
import 'package:pas1_mobile_11pplg2_23/pages/page_menus/favorite_page.dart';
import 'package:pas1_mobile_11pplg2_23/pages/page_menus/profile_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    final ResponsifController responsifControler =
        Get.put(ResponsifController());

    final List<Widget> pages = [
      ApiPage(),
      FavouritePage(),
      ProfilePage()
    ];

    return Obx(() {
      return Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeMenu,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My Account")
          ],
        ),
      );
    });
  }
}
