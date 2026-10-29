import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordRemoteDataSource {
  Future<void> sendResetLink({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
