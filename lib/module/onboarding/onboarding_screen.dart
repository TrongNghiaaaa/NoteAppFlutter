import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/config/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  bool _autoPlay = true; // Kiểm soát tự động chuyển slide

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/logo_1.png",
      "text":
          "Ghi lại bất cứ điều gì bạn muốn đạt được, hôm nay hoặc trong tương lai",
      "buttonText": "Bắt đầu ngay",
    },
    {
      "image": "assets/images/logo_2.png",
      "text": "Mục tiêu khác nhau, cách ghi chú cũng khác nhau.",
      "buttonText": "Tiếp theo",
    },
    {
      "image": "assets/images/logo_3.png",
      "text":
          "Ghi chú văn bản, danh sách kiểm tra hoặc kết hợp cả hai. Linh hoạt theo nhu cầu của bạn!",
      "buttonText": "Tiến đến đăng nhập",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarybase,
      body: Stack(
        children: [
          Column(
            children: [
              const Gap(128),
              CarouselSlider(
                items: onboardingData.map((item) {
                  return Column(
                    children: [
                      Image.asset(
                        onboardingData[_currentIndex]['image']!,
                        height: 280,
                        width: 280,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 24, bottom: 40),
                        child: Text(
                          onboardingData[_currentIndex]['text']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          if (_currentIndex == onboardingData.length - 1) {
                            Get.toNamed(Routes.login);
                          } else {
                            setState(() {
                              _currentIndex++;
                              onboardingData.length == _currentIndex;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    onboardingData[_currentIndex]
                                        ['buttonText']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                      if (_currentIndex >= 1)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _currentIndex--;
                              onboardingData.length - 1 == _currentIndex;
                            });
                          },
                          child: const Text(
                            'Quay lại',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: _autoPlay,
                  height: MediaQuery.of(context).size.height * 0.75,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                      if (_currentIndex == onboardingData.length - 1) {
                        _autoPlay =
                            false; // Dừng tự động chạy khi đến slide cuối
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.28,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingData.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? AppColors.indicatorSecondaryBase
                          : Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
