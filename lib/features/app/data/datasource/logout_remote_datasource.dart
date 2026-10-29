import 'package:firebase_auth/firebase_auth.dart';

class LogoutRemoteDataSource {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
