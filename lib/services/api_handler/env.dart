/// Enum to define Application Environment instance
enum Environment { development, production }

class EnvironmentConstants {
  static String? config;

  /// method to set environment
  static String setEnvironment(Environment env) {
    switch (env) {
      case Environment.development:
        config = "https://newsapi.org/";
        break;
      case Environment.production:
        config = "https://newsapi.org/";
        break;
    }
    return config!;
  }
}
