import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/app_bar/custom_app_bar.dart';
import '../../../../core/utils/widgets/empty_screen/empty_screen.dart';
import '../../../../core/utils/widgets/loading/custom_loading_data.dart';
import '../../../../core/utils/widgets/refresh_indicator/custom_refresh_indicator.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..getNotifications(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: 'Notifications'),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            final cubit = context.read<NotificationsCubit>();
            if (state is NotificationsErrorState) {
              return EmptyScreen(emptyText: state.errorMessage);
            } else if (state is NotificationsSuccessState) {
              if (state.notifications.isEmpty) {
                return EmptyScreen(emptyText: 'No notifications yet');
              }
              return CustomRefreshIndicator(
                onRefresh: cubit.getNotifications,
                child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  itemCount: state.notifications.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return NotificationItem(notification: state.notifications[index]);
                  },
                ),
              );
            }
            return CustomLoadingData();
          },
        ),
      ),
    );
  }
}
