import 'package:firebase_core/firebase_core.dart';

import '../../../firebase_options.dart';

class FirebaseDependency {
  static Future<void> inttFirebaseDependency() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
