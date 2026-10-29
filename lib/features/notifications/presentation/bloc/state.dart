import '../../domain/entities/notification_entity.dart';

abstract class NotificationsState {}

class NotificationsInitState extends NotificationsState {}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsErrorState extends NotificationsState {
  final String errorMessage;

  NotificationsErrorState({required this.errorMessage});
}

class NotificationsSuccessState extends NotificationsState {
  final List<NotificationEntity> notifications;

  NotificationsSuccessState({required this.notifications});
}
