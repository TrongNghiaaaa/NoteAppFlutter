import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:note_app/common/widgets/common_appbar_widget.dart';
import 'package:note_app/common/widgets/common_container_topic.dart';
import 'package:note_app/config/theme/app_colors.dart';

class CreateNewNote extends StatelessWidget {
  static const String routeName = '/createnewnote';
  const CreateNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        backgroundColor: Colors.white,
        title: "Create New Note",
        titleColor: AppColors.black,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
        child: Column(
          children: [
            Text(
              "bạn muốn ghi chú gì?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CommonContainerTopic(
              title: "Ghi chú văn bản",
              description: "Ghi chú văn bản, ghi chú nhanh",
              icon: Icons.text_fields,
              backgroundColor: AppColors.primarybase,
              iconBackgroundColor: Colors.black26,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Image.asset("assets/icons/icon_gamini.png"),
      ),
    );
  }
}
