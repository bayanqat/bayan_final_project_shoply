import 'package:dartz/dartz.dart';

import '../entities/notification_entity.dart';

abstract class NotificationsRepo {
  Future<Either<String, List<NotificationEntity>>> getNotifications();

  Future<Either<String, bool>> markAllAsRead();
}
