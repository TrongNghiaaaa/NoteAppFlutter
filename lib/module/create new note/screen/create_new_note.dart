import 'package:flutter/material.dart';
import 'package:note_app/common/widgets/common_appbar_widget.dart';

class CreateNewNote extends StatelessWidget {
  static const String routeName = '/createnewnote';
  const CreateNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Create New Note",
      ),
      body: const Column(
        children: [
          Text("Create New Note"),
        ],
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
