import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8.0),
          splashFactory: InkSplash.splashFactory,
        ),
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Hey! This is a SnackBar message.'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          'Show SnackBar',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
