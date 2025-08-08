import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/request_state_enum.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/entities/movie_entity.dart';
import '../controller/movies_providers.dart';
import 'movie_details_view.dart';

class TopRatedMoviesView extends ConsumerStatefulWidget {
  static const String routeName = '/topRatedMovies';
  const TopRatedMoviesView({super.key});

  @override
  ConsumerState<TopRatedMoviesView> createState() => _TopRatedMoviesViewState();
}

class _TopRatedMoviesViewState extends ConsumerState<TopRatedMoviesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(moviesProvider.notifier).getTopRatedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final topRatedState = ref.watch(topRatedStateProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Top Rated Movies',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _buildBody(topRatedMovies, topRatedState),
    );
  }

  Widget _buildBody(List<MovieEntity> movies, RequestState state) {
    switch (state) {
      case RequestState.loading:
        return _buildShimmerList();
      case RequestState.error:
        return _buildErrorWidget();
      case RequestState.success:
        if (movies.isEmpty) {
          return _buildEmptyWidget();
        }
        return _buildMoviesList(movies);
    }
  }

  Widget _buildMoviesList(List<MovieEntity> movies) {
    return RefreshIndicator(
      onRefresh: () => ref.read(moviesProvider.notifier).getTopRatedMovies(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _buildMovieCard(movie);
        },
      ),
    );
  }

  Widget _buildMovieCard(MovieEntity movie) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailView(movieId: movie.id),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail image on the left
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: 80.0,
                  height: 120.0,
                  child: CachedNetworkImage(
                    imageUrl: ApiConstants.imageUrl(movie.posterPath),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        color: Colors.grey[850],
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[850],
                      child: const Icon(
                        Icons.movie,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              // Details on the right
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and year
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      movie.releaseDate.year.toString(), // Extract year
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Star rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18.0),
                        const SizedBox(width: 4.0),
                        Text(
                          movie.formattedVoteAverage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '(${movie.voteCount} votes)',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    // Brief synopsis
                    Text(
                      movie.overview,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 13.0,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    width: 80.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                // Details shimmer
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 20.0,
                          width: double.infinity,
                          color: Colors.grey[850],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 16.0,
                          width: 60.0,
                          color: Colors.grey[850],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 16.0,
                          width: 120.0,
                          color: Colors.grey[850],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Column(
                          children: [
                            Container(
                              height: 14.0,
                              width: double.infinity,
                              color: Colors.grey[850],
                            ),
                            const SizedBox(height: 4.0),
                            Container(
                              height: 14.0,
                              width: double.infinity,
                              color: Colors.grey[850],
                            ),
                            const SizedBox(height: 4.0),
                            Container(
                              height: 14.0,
                              width: 200.0,
                              color: Colors.grey[850],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 64.0),
          const SizedBox(height: 16.0),
          const Text(
            'Failed to load top rated movies',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () =>
                ref.read(moviesProvider.notifier).getTopRatedMovies(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_outlined, color: Colors.grey, size: 64.0),
          SizedBox(height: 16.0),
          Text(
            'No top rated movies found',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
