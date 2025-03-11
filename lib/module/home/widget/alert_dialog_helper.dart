import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:note_app/config/theme/app_colors.dart';
import 'package:note_app/module/authencation/screen/login_screen.dart';

Future<void> showAlertDialog(
    BuildContext context,
    String title,
    String content,
    VoidCallback onPressedNextPage,
    VoidCallback onPressedPreviousPage,
    String textButton1,
    String textButton2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SizedBox(
        width: 300,
        height: 250,
        child: AlertDialog(
          actionsPadding:
              const EdgeInsets.only(right: 15, left: 15, bottom: 24),
          contentPadding: const EdgeInsets.only(
            top: 16,
            bottom: 30,
            left: 24,
            right: 24,
          ),
          backgroundColor: Colors.white,
          contentTextStyle:
              const TextStyle(fontSize: 12, color: AppColors.textColorDarkGrey),
          title: Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black)),
          content: Text(content),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(textButton1),
                  onPressed: () {
                    onPressedPreviousPage();
                  },
                ),
                TextButton(
                  child: Text(textButton2),
                  onPressed: () {
                    onPressedNextPage();
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const LoginScreen(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
