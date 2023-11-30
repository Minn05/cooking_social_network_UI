class ApiEndPoints {
  static const String barseUrl = 'http://localhost:5000/api/';

  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
}
