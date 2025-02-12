import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/config/app_page.dart';
import 'package:note_app/core/config/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // ẩn bàn phím khi click ra ngoài
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.onboarding,
        getPages: AppPage.pages,
      ),
    );
  }
}
