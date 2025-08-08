import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/helpers/runtime_cache.dart';
import '../movies/ui/controller/movies_providers.dart';
import '../tv_shows/ui/controller/tv_shows_providers.dart';

class CacheDebugWidget extends ConsumerWidget {
  const CacheDebugWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesCacheStatus = ref.watch(moviesCacheStatusProvider);
    final tvShowsCacheStatus = ref.watch(tvShowsCacheStatusProvider);
    final hasMoviesCache = ref.watch(hasMoviesCachedDataProvider);
    final hasTvShowsCache = ref.watch(hasTvShowsCachedDataProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Cache Status (1-minute expiry)',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 12.0),
          _buildCacheSection('Movies', moviesCacheStatus, hasMoviesCache),
          const SizedBox(height: 8.0),
          _buildCacheSection('TV Shows', tvShowsCacheStatus, hasTvShowsCache),
          const SizedBox(height: 12.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  RuntimeCache().clearAll();
                  ref.invalidate(moviesCacheStatusProvider);
                  ref.invalidate(tvShowsCacheStatusProvider);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                ),
                child: const Text('Clear All Cache'),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  ref.read(moviesProvider.notifier).refreshAllMovies();
                  ref.read(tvShowsProvider.notifier).refreshAllTvShows();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                ),
                child: const Text('Force Refresh All'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCacheSection(
    String title,
    Map<String, bool> cacheStatus,
    bool hasCache,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              hasCache ? Icons.check_circle : Icons.cancel,
              color: hasCache ? Colors.green : Colors.red,
              size: 16.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        ...cacheStatus.entries
            .where(
              (entry) =>
                  entry.key.contains(title.toLowerCase().replaceAll(' ', '_')),
            )
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  '${entry.key.split('_').last}: ${entry.value ? "✓ Cached" : "✗ Expired"}',
                  style: TextStyle(
                    color: entry.value ? Colors.green[300] : Colors.red[300],
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
