// lib/module/home/widget/root.dart
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/module/finish/screen/finished_screen.dart';
import 'package:note_app/module/home/screen/home_screen.dart';
import 'package:note_app/module/search/screen/search_screen.dart';
import 'package:note_app/module/setting/screen/setting_screen.dart';

import '../controller/root_controller.dart';

// Controller quản lý page index

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final rootController = Get.find<RootController>();

    return Scaffold(
      backgroundColor: cs.onPrimary,
      body: PageView(
        controller: rootController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          FinishedScreen(),
          SearchScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: cs.primary,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
                icon: 'assets/icons/home.svg', label: 'Home', index: 0, cs: cs),
            _NavItem(
                icon: 'assets/icons/clipboard-check.svg',
                label: 'Finished',
                index: 1,
                cs: cs),
            const SizedBox(width: 40),
            _NavItem(
                icon: 'assets/icons/search.svg',
                label: 'Search',
                index: 2,
                cs: cs),
            _NavItem(
                icon: 'assets/icons/cog.svg',
                label: 'Settings',
                index: 3,
                cs: cs),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Note',
        shape: const CircleBorder(),
        splashColor: cs.onPrimary,
        onPressed: () => Get.toNamed(Routes.createNote),
        backgroundColor: cs.onPrimary,
        child: Icon(Icons.add, size: 32, color: cs.primary),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;
  final int index;
  final ColorScheme cs;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.cs,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RootController>();

    return Obx(() {
      final isSelected = controller.currentIndex.value == index;
      final itemColor = isSelected ? cs.onPrimary : cs.surface;

      return GestureDetector(
        onTap: () => controller.changePage(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: isSelected ? Colors.white : Colors.transparent,
                width: isSelected ? 3 : 0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon, width: 24, color: itemColor),
              const Gap(4),
              Text(
                label,
                style: TextStyle(
                  color: itemColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
