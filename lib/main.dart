import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/config/app%20page/app_page.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/config/theme/theme_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Obx(() => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Notes App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              primarySwatch: Colors.purple,
              scaffoldBackgroundColor: Colors.white,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: Routes.onboarding,
            getPages: AppPage.pages,
          )),
    );
  }
}
