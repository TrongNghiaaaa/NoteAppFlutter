import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/module/create%20new%20note/screen/create_new_note.dart';
import 'package:note_app/module/home/screen/binding/home_binding.dart';
import 'package:note_app/module/onboarding/onboarding_screen.dart';
import 'package:note_app/module/authencation/screen/register_screen.dart';
import 'package:note_app/module/authencation/screen/login_screen.dart';
import 'package:note_app/module/authencation/screen/forgot_password_screen.dart';
import 'package:note_app/module/root/screen/root.dart';
import 'package:note_app/module/root/binding/root_binding.dart';
import 'package:note_app/module/setting/binding/setting_binding.dart';
import 'package:note_app/module/setting/screen/setting_screen.dart';

import '../../module/authencation/binding/login_email_binding.dart';
import '../../module/authencation/binding/regisster_binding.dart';
import '../../module/finish/binding/finish_binding.dart';
import '../../module/search/binding/search_binding.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginEmailBinding(),
    ),
    GetPage(name: Routes.root, page: () => const Root(), bindings: [
      RootBinding(),
      SettingBinding(),
      HomeBinding(),
      FinishBinding(),
      SearchBinding(),
    ]),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.createNote,
      page: () => const CreateNewNote(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const SettingsScreen(),
    ),
  ];
}
