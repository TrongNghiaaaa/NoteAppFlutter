import 'package:get/get.dart';
import 'package:note_app/core/config/routes.dart';
import 'package:note_app/module/home/authencation/binding/login_email_binding.dart';
import 'package:note_app/module/home/authencation/binding/register_binding.dart';
import 'package:note_app/module/home/ui/onboarding_screen.dart';
import 'package:note_app/module/home/ui/register_screen.dart';
import 'package:note_app/module/home/ui/login_screen.dart';
import 'package:note_app/module/home/ui/forgot_password_screen.dart';
import 'package:note_app/module/home/ui/bottom_appbar_widget.dart';

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
    GetPage(
      name: Routes.appbar,
      page: () => const BottomAppBarWidget(),
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
