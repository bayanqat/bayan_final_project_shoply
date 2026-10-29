import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/date_format_helper.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/header/custom_icon_header.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import 'legal_section_item.dart';

class LegalContentView extends StatelessWidget {
  const LegalContentView({super.key, required this.docId, required this.iconData});
  final String docId;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LegalCubit()..getContent(docId: docId),
      child: BlocBuilder<LegalCubit, LegalState>(
        builder: (context, state) {
          if (state is LegalErrorState) {
            return EmptyScreen(emptyText: state.errorMessage);
          } else if (state is LegalSuccessState) {
            final content = state.content;
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              children: [
                CustomIconHeader(
                  iconData: iconData,
                  title: content.title ?? '',
                  subtitle: 'Last updated: ${DateFormatHelper.longDate(content.lastUpdated)}',
                ),
                SizedBox(height: 24.h),
                for (var i = 0; i < content.sections.length; i++)
                  LegalSectionItem(number: i + 1, section: content.sections[i]),
              ],
            );
          }
          return CustomLoadingData();
        },
      ),
    );
  }
}
