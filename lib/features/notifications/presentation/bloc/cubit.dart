import 'package:final_project_shoply/features/notifications/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/notifications_remote_datasource.dart';
import '../../data/repository/notifications_repo_impl.dart';
import '../../domain/usecase/notifications_usecase.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitState());

  final _notificationsUseCase = NotificationsUseCase(
    NotificationsRepoImpl(NotificationsRemoteDataSource()),
  );

  Future<void> getNotifications() async {
    emit(NotificationsLoadingState());
    final result = await _notificationsUseCase.getNotifications();
    result.fold(
      (errorMessage) {
        emit(NotificationsErrorState(errorMessage: errorMessage));
      },
      (notifications) {
        // Shown with their unread dot this time, then saved as read for next time
        emit(NotificationsSuccessState(notifications: notifications));
        _notificationsUseCase.markAllAsRead();
      },
    );
  }
}
