import 'package:get/get.dart';
import 'package:note_app/core/config/routes.dart';
import 'package:note_app/module/home/authencation/binding/register_binding.dart';
import 'package:note_app/module/home/onboarding_screen.dart';
import 'package:note_app/module/home/register_screen.dart';
import 'package:note_app/module/home/ui/login_screen.dart';
import 'package:note_app/module/home/widget/forgot_password.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
  ];
}
