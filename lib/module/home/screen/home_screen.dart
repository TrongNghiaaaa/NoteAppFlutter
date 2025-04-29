import 'package:flutter/material.dart';
import 'package:note_app/config/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                    height: screenHeight * 0.3,
                    child: Image.asset("assets/images/image_home.png",
                        fit: BoxFit.contain),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    "Bắt đầu hành trình của bạn",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Text(
                      "Mỗi hành trình lớn đều bắt đầu bằng một bước nhỏ.\nHãy ghi lại ý tưởng đầu tiên và bắt đầu ngay hôm nay!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Icon(
                    Icons.arrow_circle_down,
                    size: screenWidth * 0.12,
                    color: AppColors.primarybase,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
