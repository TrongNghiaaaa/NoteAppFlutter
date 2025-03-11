import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/module/authencation/binding/binding/login_email_binding.dart';
import 'package:note_app/module/authencation/binding/binding/register_binding.dart';
import 'package:note_app/module/create%20new%20note/screen/create_new_note.dart';
import 'package:note_app/module/onboarding/onboarding_screen.dart';
import 'package:note_app/module/authencation/screen/register_screen.dart';
import 'package:note_app/module/authencation/screen/login_screen.dart';
import 'package:note_app/module/authencation/screen/forgot_password_screen.dart';
import 'package:note_app/module/home/model/bottom_appbar_widget.dart';

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
    GetPage(
      name: Routes.createNote,
      page: () => const CreateNewNote(),
    ),
  ];
}
