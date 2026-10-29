import 'package:flutter/material.dart';

import 'core/dependencies/main/main_dependency.dart';
import 'core/seed/firestore_seeder.dart';
import 'features/app/view/shoply_app.dart';

void main() async {
  // Local storage and Firebase
  await MainDependency.mainInitDependency();
  await FirestoreSeeder.seed(); // run once, then delete this line
  runApp(const ShoplyApp());
}
