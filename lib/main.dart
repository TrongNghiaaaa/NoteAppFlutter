import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/config/app%20page/app_page.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/config/theme/theme_controller.dart';
import 'config/theme/app_theme.dart';
import 'firebase_options.dart';
import 'module/setting/controller/setting_controller.dart';

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
    Get.put(SettingController());
    final themeController = Get.put(ThemeController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Obx(() => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Notes App',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeController.theme,
            initialRoute: Routes.onboarding,
            getPages: AppPage.pages,
          )),
    );
  }
}
