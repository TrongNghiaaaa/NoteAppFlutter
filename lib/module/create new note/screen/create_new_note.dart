import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:async';

import 'package:note_app/common/widgets/common_appbar_widget.dart';

class CreateNewNote extends StatefulWidget {
  static const String routeName = '/createnewnote';
  const CreateNewNote({super.key});

  @override
  _CreateNewNoteState createState() => _CreateNewNoteState();
}

class _CreateNewNoteState extends State<CreateNewNote> {
  bool _showGuide = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showGuide = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        showBackButton: true,
        title: "Tạo ghi chú mới",
        backIconColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_showGuide)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Nhấn vào một danh mục để bắt đầu tạo ghi chú!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            const Text(
              "Bạn muốn ghi chú gì?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: CommonContainerTopic(
                            title: topics[index]['title'],
                            description: topics[index]['description'],
                            icon: topics[index]['icon'],
                            backgroundColor: topics[index]['backgroundColor'],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonContainerTopic extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;

  const CommonContainerTopic({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> topics = [
  {
    "title": "Ý tưởng thú vị",
    "description": "Sử dụng vùng nhập văn bản tự do, viết bất cứ điều gì",
    "icon": Icons.lightbulb,
    "backgroundColor": Colors.purple,
  },
  {
    "title": "Mua sắm",
    "description": "Dùng danh sách kiểm tra để không bỏ sót gì",
    "icon": Icons.shopping_cart,
    "backgroundColor": Colors.green,
  },
  {
    "title": "Mục tiêu",
    "description": "Lập mục tiêu gần và xa, ghi chú để tập trung hơn",
    "icon": Icons.flag,
    "backgroundColor": Colors.amber,
  },
  {
    "title": "Hướng dẫn",
    "description": "Tạo hướng dẫn cho các hoạt động thường ngày",
    "icon": Icons.menu_book,
    "backgroundColor": Colors.red,
  },
  {
    "title": "Công việc thường ngày",
    "description": "Danh sách kiểm tra với danh mục con",
    "icon": Icons.check_circle,
    "backgroundColor": Colors.yellow.shade700,
  },
];
