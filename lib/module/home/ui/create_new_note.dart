import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateNewNote extends StatelessWidget {
  static const String routeName = '/createnewnote';
  const CreateNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Create New Note'),
      ),
    );
  }
}
