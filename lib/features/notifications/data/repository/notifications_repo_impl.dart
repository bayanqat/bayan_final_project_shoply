import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/notification_entity.dart';
import '../../domain/repository/notifications_repo.dart';
import '../datasource/notifications_remote_datasource.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final NotificationsRemoteDataSource notificationsRemoteDataSource;

  NotificationsRepoImpl(this.notificationsRemoteDataSource);

  @override
  Future<Either<String, List<NotificationEntity>>> getNotifications() async {
    try {
      final notifications = await notificationsRemoteDataSource.getNotifications();
      return Right(notifications.map((notification) => notification.toEntity()).toList());
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }

  @override
  Future<Either<String, bool>> markAllAsRead() async {
    try {
      await notificationsRemoteDataSource.markAllAsRead();
      return Right(true);
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.code} - ${e.message}');
      return Left(e.message ?? '');
    }
  }
}
