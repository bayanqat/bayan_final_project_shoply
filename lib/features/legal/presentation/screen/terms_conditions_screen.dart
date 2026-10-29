import 'package:flutter/material.dart';

import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../widgets/legal_content_view.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Terms & Conditions'),
      body: LegalContentView(
        docId: FirestoreCollections.termsConditionsDoc,
        iconData: Icons.description_outlined,
      ),
    );
  }
}
