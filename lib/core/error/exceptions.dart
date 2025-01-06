class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

class CacheException implements Exception {}
