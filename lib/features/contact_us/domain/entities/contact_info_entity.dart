class ContactInfoEntity {
  final String? title;
  final String? subtitle;
  final String? supportEmail;
  final List<String> subjects;

  const ContactInfoEntity({this.title, this.subtitle, this.supportEmail, this.subjects = const []});
}
