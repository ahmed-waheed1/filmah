class CacheItem<T> {
  final T data;
  final DateTime timestamp;

  CacheItem({
    required this.data,
    required this.timestamp,
  });

  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    return difference.inMinutes >= 1;
  }
}

class RuntimeCache {
  static final RuntimeCache _instance = RuntimeCache._internal();
  factory RuntimeCache() => _instance;
  RuntimeCache._internal();

  final Map<String, CacheItem> _cache = {};

  void store<T>(String key, T data) {
    _cache[key] = CacheItem<T>(
      data: data,
      timestamp: DateTime.now(),
    );
  }

  T? get<T>(String key) {
    final item = _cache[key];
    if (item == null) return null;

    if (item.isExpired) {
      _cache.remove(key);
      return null;
    }

    return item.data as T?;
  }

  bool hasValidData(String key) {
    final item = _cache[key];
    if (item == null) return false;

    if (item.isExpired) {
      _cache.remove(key);
      return false;
    }

    return true;
  }

  void clear(String key) {
    _cache.remove(key);
  }

  // Clear all cache
  void clearAll() {
    _cache.clear();
  }

  Map<String, bool> getCacheStatus() {
    return _cache.map((key, value) => MapEntry(key, !value.isExpired));
  }
}

class MovieCacheKeys {
  static const String nowPlaying = 'movies_now_playing';
  static const String popular = 'movies_popular';
  static const String topRated = 'movies_top_rated';
}

class TvShowCacheKeys {
  static const String onTheAir = 'tv_shows_on_the_air';
  static const String popular = 'tv_shows_popular';
  static const String topRated = 'tv_shows_top_rated';
}
