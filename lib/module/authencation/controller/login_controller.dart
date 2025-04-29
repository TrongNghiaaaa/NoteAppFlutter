import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/common/widgets/common_loading_widget.dart';

class GoogleAuthController extends GetxController {
  var user = FirebaseAuth.instance.currentUser.obs;

  /// Đăng nhập bằng Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      Get.dialog(const CommonLoading(), barrierDismissible: false);

      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        Get.back();
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Cập nhật ảnh nếu chưa có
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.photoURL == null) {
        await currentUser.updatePhotoURL(googleUser.photoUrl);
        await currentUser.reload();
        user.value = FirebaseAuth.instance.currentUser;
      }

      Get.back();
      return userCredential;
    } catch (error) {
      Get.back();
      print("Lỗi đăng nhập Google: $error");
      Get.snackbar('Lỗi', 'Đăng nhập Google thất bại!');
      return null;
    }
  }

  /// Cập nhật ảnh đại diện từ thư viện
  Future<void> updateProfilePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    File file = File(pickedFile.path);
    try {
      Get.dialog(const CommonLoading(), barrierDismissible: false);

      String userId = user.value!.uid;
      final ref =
          FirebaseStorage.instance.ref().child('user_avatars/$userId.jpg');
      await ref.putFile(file);
      String downloadURL = await ref.getDownloadURL();

      // Cập nhật ảnh đại diện trên Firebase Auth
      await user.value!.updatePhotoURL(downloadURL);
      await user.value!.reload();
      user.refresh(); // Làm mới UI

      Get.back();
    } catch (e) {
      Get.back();
      print("Lỗi cập nhật avatar: $e");
      Get.snackbar("Lỗi", "Không thể cập nhật avatar");
    }
  }

  /// Đăng xuất
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    user.value = null; // Reset user
  }
}
