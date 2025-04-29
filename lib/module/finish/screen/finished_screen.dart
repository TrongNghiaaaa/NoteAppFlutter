import 'package:flutter/material.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

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
                    "Chưa Có Ghi Chú Hoàn Thành",
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
                      "Khi bạn tạo một ghi chú và hoàn thành nó, nó sẽ xuất hiện trên màn hình này. Vì vậy, hãy bắt đầu hành trình của bạn!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  Image.asset("assets/icons/Arrow.png")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
