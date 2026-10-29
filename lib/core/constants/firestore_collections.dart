/// Collection and document names, matching FirestoreSeeder
class FirestoreCollections {
  static const String users = 'users';
  // Old collection used by signup before the switch to `users`
  static const String legacyUsers = 'User';
  static const String favorites = 'favorites';
  static const String cart = 'cart';
  static const String notifications = 'notifications';
  static const String categories = 'categories';
  static const String products = 'products';
  static const String orders = 'orders';
  static const String contactMessages = 'contact_messages';
  static const String appContent = 'app_content';

  // Documents inside app_content
  static const String aboutDoc = 'about';
  static const String contactDoc = 'contact';
  static const String privacyPolicyDoc = 'privacy_policy';
  static const String termsConditionsDoc = 'terms_conditions';
}
