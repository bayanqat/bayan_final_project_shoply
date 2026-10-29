import 'package:flutter/material.dart';

import '../../theme/app_palette.dart';

class CustomLoadingData extends StatelessWidget {
  const CustomLoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: context.colors.primary));
  }
}
