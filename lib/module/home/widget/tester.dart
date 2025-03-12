import 'package:flutter/material.dart';
import 'package:note_app/module/authencation/screen/login_screen.dart';
import 'package:note_app/module/home/widget/alert_dialog_helper.dart';
import 'package:note_app/module/home/widget/snack_bar_widget.dart';
import 'package:note_app/module/home/widget/tester.dart';

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Tester'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showAlertDialog(context, 'Thông báo',
                      'Thông báo này để test showalertdialog Nghĩa dz.', () {
                    Navigator.of(context).pop();
                  }, () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const LoginScreen(),
                        ));
                  }, 'Close', 'Next');
                },
                child: const Text('Show AlertDialog'),
              ),
              const SnackBarPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxList extends StatefulWidget {
  const CheckBoxList({super.key});

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Item 1', 'isChecked': false},
    {'name': 'Item 2', 'isChecked': false},
    {'name': 'Item 3', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _items.map((item) {
        return CheckboxListTile(
          title: Text(item['name']),
          value: item['isChecked'],
          onChanged: (bool? value) {
            setState(() {
              item['isChecked'] = value!;
            });
          },
        );
      }).toList(),
    );
  }
}
