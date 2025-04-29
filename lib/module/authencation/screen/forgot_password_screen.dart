import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import 'package:note_app/module/authencation/screen/login_screen.dart';
import 'package:note_app/module/home/widget/alert_dialog_helper.dart';
import 'package:note_app/module/home/widget/snack_bar_widget.dart';
import 'package:note_app/module/home/widget/text_form_field_widget.dart';

import '../../../common/widgets/common_regex.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);

    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: theme.iconTheme,
        title: const Text('Quay lại đăng nhập'),
        titleTextStyle: theme.textTheme.titleMedium,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(300),
                Text(
                  "Quên mật khẩu",
                  style: theme.textTheme.headlineLarge,
                ),
                const Gap(16),
                Text(
                  "Nhập địa chỉ email của bạn để nhận mã tạo mật khẩu mới",
                  style: theme.textTheme.bodyMedium,
                ),
                TextFormFieldWidget(
                  hintText: '0xxxxxxxxx',
                  labelText: "Số điện thoại",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Vui lòng nhập số điện thoại';
                    }
                    if (!CommonRegex.phoneRegExp.hasMatch(v)) {
                      return 'Số điện thoại không hợp lệ';
                    }

                    return null;
                  },
                ),
                const Gap(32),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      showAlertDialog(context, "Thông báo",
                          "Chúc mừng! Bạn đã lấy lại mật khẩu thành công", () {
                        Navigator.of(context).pop();
                      }, () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const LoginScreen(),
                            ));
                      }, "Đóng", "Đi đến đăng nhập");
                    } else {
                      const SnackBarPage();
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 54,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(16),
                          Spacer(),
                          Text(
                            "Gửi mã",
                            style: theme.textTheme.labelLarge!
                                .copyWith(color: theme.colorScheme.primary),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: theme.colorScheme.primary,
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
      ),
    );
  }
}
