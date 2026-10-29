class ErrorHandleHelper {
  static String getCustomErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-credential':
        return 'Incorrect email or password. Please try again.';
      case 'email-already-in-use':
        return 'This email address is already registered.';
      case 'weak-password':
        return 'The password entered is too weak. Try a longer combination.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This user account has been disabled. Contact support.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'email-not-verified':
        return 'Please verify your email and then login.';
      case 'network-request-failed':
        return 'No internet connection. Please check your network.';
      case 'wrong-password':
        return 'The current password is incorrect.';
      case 'requires-recent-login':
        return 'Please log in again and then try this action.';
      case 'operation-not-allowed':
        return 'Email and password sign up is not enabled.';
      default:
        return 'An unexpected authentication error occurred. Please try again.';
    }
  }
}
