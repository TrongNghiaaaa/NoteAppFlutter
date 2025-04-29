import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:note_app/config/theme/app_colors.dart';
import 'package:note_app/module/authencation/screen/login_screen.dart';
import 'package:note_app/module/home/widget/alert_dialog_helper.dart';
import 'package:note_app/module/home/widget/snack_bar_widget.dart';
import 'package:note_app/module/home/widget/text_form_field_widget.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.primarybase),
        title: const Text('Back to login'),
        titleTextStyle: const TextStyle(
            color: AppColors.primarybase,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(300),
              const Text(
                "Create a New Password",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primarybase,
                ),
              ),
              const Gap(16),
              const Text(
                "Your new password should be different from the previous password",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColorDarkGrey,
                ),
              ),
              TextFormFieldWidget(
                autofocus: true,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: "********",
                labelText: "New Password",
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              TextFormFieldWidget(
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: "********",
                labelText: "Retype New Password",
                obscureText: true,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    showAlertDialog(context, "Thông báo",
                        "Chúc mừng bạn đã lấy lại mật khẩu thành công", () {
                      Navigator.of(context).pop();
                    }, () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const LoginScreen(),
                          ));
                    }, "Close", "Go to login");
                  } else {
                    const SnackBarPage();
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primarybase),
                    height: 54,
                    width: double.infinity,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gap(16),
                        Spacer(),
                        Text(
                          "Create New Password",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.white,
                          size: 20,
                        ),
                        Gap(20)
                      ],
                    )),
              ),
              const Gap(32)
            ],
          ),
        ),
      ),
    );
  }
}
