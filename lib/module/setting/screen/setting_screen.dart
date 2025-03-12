import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/common/widgets/common_appbar_widget.dart';
import 'package:note_app/config/theme/theme_controller.dart';
import 'package:note_app/module/authencation/controller/login_controller.dart';
import 'package:note_app/module/setting/controller/setting_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.put(SettingController());
    final themeController = Get.find<ThemeController>();
    final googleAuthController = Get.put(GoogleAuthController());
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: const CommonAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => googleAuthController.updateProfilePhoto(),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: user!.photoURL != null
                        ? NetworkImage(user.photoURL!)
                        : const AssetImage('assets/default_avatar.png')
                            as ImageProvider,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.displayName.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(user.email?.toString() ?? "",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => googleAuthController.updateProfilePhoto(),
                icon: const Icon(Icons.edit, size: 16, color: Colors.purple),
                label: const Text("Edit Profile",
                    style: TextStyle(color: Colors.purple, fontSize: 14)),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const Divider(thickness: 1),
            _buildSettingsItem(Icons.lock, "Change Password"),
            _buildSettingsItem(Icons.text_fields, "Text Size",
                trailing: "Medium"),
            _buildSettingsItem(Icons.notifications, "Notifications",
                trailing: "All active",
                onTap: () =>
                    _showNotificationSettings(context, notificationController)),
            _buildSettingsItem(Icons.brightness_6, "Dark Mode",
                trailingWidget: Obx(() => Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (value) => themeController.toggleTheme(),
                    ))),
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Log Out", style: TextStyle(color: Colors.red)),
              onTap: () => googleAuthController.signOut(),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildSettingsItem(IconData icon, String title,
      {String? trailing, Widget? trailingWidget, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: trailingWidget ??
          (trailing != null
              ? Text(trailing, style: const TextStyle(color: Colors.grey))
              : const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey)),
      onTap: onTap,
    );
  }

  void _showNotificationSettings(
      BuildContext context, SettingController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () => Get.back(),
                ),
              ),
              _buildSwitchTile(
                  "Email Notifications", controller.emailNotifications),
              _buildSwitchTile(
                  "Push Notifications", controller.pushNotifications,
                  activeColor: Colors.purple),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSwitchTile(String title, RxBool switchValue,
      {Color activeColor = Colors.grey}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Obx(() => Switch(
            value: switchValue.value,
            activeColor: activeColor,
            onChanged: (value) => switchValue.value = value,
          )),
    );
  }
}
