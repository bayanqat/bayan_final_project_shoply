import 'package:flutter/material.dart';

import '../firebase/firebase_dependency.dart';
import '../local_storage/local_storage_dependency.dart';

class MainDependency {
  static Future<void> mainInitDependency() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalStorageDependency.initloaclStoradeDependency();
    await FirebaseDependency.inttFirebaseDependency();
  }
}
