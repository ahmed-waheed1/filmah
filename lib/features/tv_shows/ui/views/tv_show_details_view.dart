import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constants.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../controller/tv_shows_providers.dart';

class TvShowDetailView extends ConsumerWidget {
  static const String routeName = '/tvShowDetail';
  final int tvShowId;

  const TvShowDetailView({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now, we'll find the TV show from the existing lists
    // In the future, this should use a dedicated TV show details provider
    final onTheAirTvShows = ref.watch(onTheAirTvShowsProvider);
    final popularTvShows = ref.watch(popularTvShowsProvider);
    final topRatedTvShows = ref.watch(topRatedTvShowsProvider);

    // Find the TV show in any of the lists
    TvShowEntity? tvShow;
    for (final show in [
      ...onTheAirTvShows,
      ...popularTvShows,
      ...topRatedTvShows,
    ]) {
      if (show.id == tvShowId) {
        tvShow = show;
        break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: tvShow != null
          ? TvShowDetailContent(tvShow: tvShow)
          : _buildLoadingOrNotFound(context),
    );
  }

  Widget _buildLoadingOrNotFound(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'TV Show Details',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.tv_outlined, color: Colors.grey, size: 64.0),
            SizedBox(height: 16.0),
            Text(
              'TV Show not found',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Please try going back and selecting the show again',
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TvShowDetailContent extends ConsumerWidget {
  final TvShowEntity tvShow;

  const TvShowDetailContent({
    super.key,
    required this.tvShow,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        key: const Key('tvShowDetailScrollView'),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: 250.0,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: FadeIn(
                duration: const Duration(milliseconds: 500),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.5, 1.0, 1.0],
                    ).createShader(
                      Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    imageUrl: ApiConstants.imageUrl(tvShow.backdropPath),
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[850],
                      child: const Icon(
                        Icons.tv,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvShow.name,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            tvShow.firstAirDate.year.toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              tvShow.formattedVoteAverage,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '(${tvShow.voteAverage.toStringAsFixed(2)})',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.5),
                            ),
                          ),
                          child: const Text(
                            'TV Series',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      tvShow.overview,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'Original Language: ${tvShow.originalLanguage.toUpperCase()}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    if (tvShow.originCountry.isNotEmpty)
                      const SizedBox(height: 4.0),
                    if (tvShow.originCountry.isNotEmpty)
                      Text(
                        'Origin Country: ${tvShow.originCountry.join(", ")}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Popularity Score: ${tvShow.popularity.toStringAsFixed(1)}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: const Text(
                  'Similar TV Shows',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: _buildSimilarTvShows(),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarTvShows() {
    return Consumer(
      builder: (context, ref, child) {
        // For now, show other popular shows as "similar"
        // In the future, this should use a dedicated similar TV shows API
        final popularTvShows = ref.watch(popularTvShowsProvider);
        final filteredShows = popularTvShows
            .where((show) => show.id != tvShow.id)
            .take(6)
            .toList();

        if (filteredShows.isEmpty) {
          return SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(20),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey.withAlpha(50)),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.tv_outlined,
                    color: Colors.grey,
                    size: 36,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No similar TV shows available',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final similarShow = filteredShows[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TvShowDetailView(tvShowId: similarShow.id),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                      imageUrl: ApiConstants.imageUrl(
                        similarShow.backdropPath.isEmpty
                            ? similarShow.posterPath
                            : similarShow.backdropPath,
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[600]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[800],
                        child: const Icon(Icons.tv, color: Colors.white),
                      ),
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: filteredShows.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
