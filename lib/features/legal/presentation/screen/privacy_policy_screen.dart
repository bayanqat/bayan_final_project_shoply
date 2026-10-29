import 'package:flutter/material.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../widgets/legal_content_view.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Privacy Policy'),
      body: LegalContentView(
        docId: FirestoreCollections.privacyPolicyDoc,
        iconData: Icons.verified_user_outlined,
      ),
    );
  }
}
