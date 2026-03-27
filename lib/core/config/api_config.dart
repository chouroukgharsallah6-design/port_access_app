class ApiConfig {
  // Override with:
  // flutter run --dart-define=API_BASE_URL=http://localhost/port_access_api
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2/port_access_api',
  );

  static String url(String path) => '$baseUrl/$path';
}
