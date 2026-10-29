class LegalContentEntity {
  final String? title;
  final DateTime? lastUpdated;
  final List<LegalSectionEntity> sections;

  const LegalContentEntity({this.title, this.lastUpdated, this.sections = const []});
}

class LegalSectionEntity {
  final String? title;
  final String? body;

  const LegalSectionEntity({this.title, this.body});
}
