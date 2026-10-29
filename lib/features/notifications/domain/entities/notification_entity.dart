class NotificationEntity {
  final String? id;
  final String? title;
  final String? body;

  /// 'order' for now; other kinds can be added later
  final String? type;
  final bool isRead;
  final DateTime? createdAt;

  const NotificationEntity({
    this.id,
    this.title,
    this.body,
    this.type,
    this.isRead = false,
    this.createdAt,
  });
}
