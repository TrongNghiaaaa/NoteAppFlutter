import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/constant/app_colors.dart';
import 'package:note_app/module/home/ui/finished_screen.dart';
import 'package:note_app/module/home/ui/home_screen.dart';
import 'package:note_app/module/home/ui/search_screen.dart';
import 'package:note_app/module/home/ui/setting_screen.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({super.key});

  @override
  State<BottomAppBarWidget> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBarWidget> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomeScreen(),
    const FinishedScreen(),
    const SearchScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index); // Giữ trạng thái trang
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorHomescr,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Không cho vuốt ngang
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
                icon: "assets/icons/home.svg", label: "Home", index: 0),
            _buildNavItem(
                icon: "assets/icons/clipboard-check.svg",
                label: "Finished",
                index: 1),
            const SizedBox(width: 40), // Khoảng trống cho FloatingActionButton
            _buildNavItem(
                icon: "assets/icons/search.svg", label: "Search", index: 2),
            _buildNavItem(
                icon: "assets/icons/cog.svg", label: "Settings", index: 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        shape: const CircleBorder(),
        splashColor: AppColors.lightGrayPercent10,
        onPressed: () {},
        backgroundColor: AppColors.primarybase,
        child: const Icon(Icons.add, size: 32, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(
      {required String icon, required String label, required int index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 32,
            color: _currentIndex == index
                ? AppColors.primarybase
                : AppColors.lightGray3,
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              color: _currentIndex == index
                  ? AppColors.primarybase
                  : AppColors.lightGray3,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
