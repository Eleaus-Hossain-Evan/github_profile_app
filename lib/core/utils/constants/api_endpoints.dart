abstract class ApiEndpoint {
  static String baseUrl = 'https://api.github.com';
  static String user = '/users/';
  static const String userName = String.fromEnvironment('GITHUB_USER');
  static const String repos = '/repos';
}
