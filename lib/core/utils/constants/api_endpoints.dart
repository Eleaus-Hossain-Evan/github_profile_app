abstract class ApiEndpoint {
  static String baseUrl = 'https://api.github.com';
  static String user = String.fromEnvironment('GITHUB_USER');
}
