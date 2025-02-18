import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Đăng xuất Firebase và Google Sign-In trước khi đăng nhập
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();

    // Hiển thị hộp thoại đăng nhập Google và yêu cầu chọn tài khoản
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null; // Người dùng hủy đăng nhập

    // Lấy thông tin xác thực từ Google
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Đăng nhập Firebase bằng Google
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (error) {
    print("Lỗi đăng nhập Google: $error");
    Get.snackbar('Lỗi', 'Đăng nhập Google thất bại!');
    return null;
  }
}
