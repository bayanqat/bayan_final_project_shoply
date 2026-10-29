import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordRemoteDataSource {
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = FirebaseAuth.instance.currentUser!;
    // Firebase requires a recent sign-in before changing the password
    final credential = EmailAuthProvider.credential(
      email: user.email ?? '',
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);
  }
}
