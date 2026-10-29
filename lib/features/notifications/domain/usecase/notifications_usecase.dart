import 'package:dartz/dartz.dart';

import '../entities/notification_entity.dart';
import '../repository/notifications_repo.dart';

class NotificationsUseCase {
  final NotificationsRepo notificationsRepo;

  NotificationsUseCase(this.notificationsRepo);

  Future<Either<String, List<NotificationEntity>>> getNotifications() {
    return notificationsRepo.getNotifications();
  }

  Future<Either<String, bool>> markAllAsRead() {
    return notificationsRepo.markAllAsRead();
  }
}
