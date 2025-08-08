import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/request_state_enum.dart';
import '../../../../core/network/api_constants.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../controller/tv_shows_providers.dart';
import '../controller/tv_shows_state.dart';
import 'popular_tv_shows_view.dart';
import 'top_rated_tv_shows_view.dart';
import 'tv_show_details_view.dart';

class TvShowsView extends ConsumerStatefulWidget {
  static const String routeName = '/tvShows';
  const TvShowsView({super.key});

  @override
  ConsumerState<TvShowsView> createState() => _TvShowsViewState();
}

class _TvShowsViewState extends ConsumerState<TvShowsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tvShowsProvider.notifier).loadAllTvShows();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tvShowsState = ref.watch(tvShowsProvider);
    print('TvShowsView: Current state: $tvShowsState');
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: () => ref.read(tvShowsProvider.notifier).refreshAllTvShows(),
        child: SingleChildScrollView(
          key: const Key('tvShowScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOnTheAirSection(tvShowsState),
              _buildPopularSection(tvShowsState),
              _buildTopRatedSection(tvShowsState),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnTheAirSection(TvShowsState tvShowsState) {
    if (tvShowsState.onTheAirState == RequestState.loading) {
      return _buildCarouselShimmer();
    }

    if (tvShowsState.onTheAirState == RequestState.error) {
      return _buildErrorWidget(
        message: tvShowsState.onTheAirMessage,
        onRetry: () => ref.read(tvShowsProvider.notifier).getOnTheAirTvShows(),
      );
    }

    if (tvShowsState.onTheAirTvShows.isEmpty) {
      return const SizedBox(
        height: 400,
        child: Center(
          child: Text(
            'No TV shows available',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          onPageChanged: (index, reason) {},
        ),
        items: tvShowsState.onTheAirTvShows.map((tvShow) {
          return GestureDetector(
            key: const Key('openTvShowMinimalDetail'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TvShowDetailView(tvShowId: tvShow.id),
                ),
              );
            },
            child: Stack(
              children: [
                ShaderMask(
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
                      stops: [0, 0.3, 0.5, 1],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    height: 560.0,
                    imageUrl: ApiConstants.imageUrl(tvShow.backdropPath),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 560.0,
                      color: Colors.grey[900],
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 560.0,
                      color: Colors.grey[900],
                      child: const Center(
                        child: Icon(Icons.error, color: Colors.white, size: 50),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.redAccent,
                              size: 16.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              'On The Air'.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          tvShow.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPopularSection(TvShowsState tvShowsState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PopularTvShowsView(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        'See More',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildHorizontalTvShowList(
          tvShows: tvShowsState.popularTvShows,
          state: tvShowsState.popularState,
          errorMessage: tvShowsState.popularMessage,
          onRetry: () => ref.read(tvShowsProvider.notifier).getPopularTvShows(),
        ),
      ],
    );
  }

  Widget _buildTopRatedSection(TvShowsState tvShowsState) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Rated",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TopRatedTvShowsView(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        'See More',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildHorizontalTvShowList(
          tvShows: tvShowsState.topRatedTvShows,
          state: tvShowsState.topRatedState,
          errorMessage: tvShowsState.topRatedMessage,
          onRetry: () =>
              ref.read(tvShowsProvider.notifier).getTopRatedTvShows(),
        ),
      ],
    );
  }

  Widget _buildHorizontalTvShowList({
    required List<TvShowEntity> tvShows,
    required RequestState state,
    required String errorMessage,
    required VoidCallback onRetry,
  }) {
    if (state == RequestState.loading) {
      return _buildHorizontalShimmer();
    }
    if (state == RequestState.error) {
      return Container(
        height: 170.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: $errorMessage',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    if (tvShows.isEmpty) {
      return Container(
        height: 170.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: const Center(
          child: Text(
            'No TV shows available',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: tvShows.length,
          itemBuilder: (context, index) {
            final tvShow = tvShows[index];
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TvShowDetailView(tvShowId: tvShow.id),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    width: 120.0,
                    fit: BoxFit.cover,
                    imageUrl: ApiConstants.imageUrl(tvShow.backdropPath),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCarouselShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: 400.0,
        width: double.infinity,
        color: Colors.grey[850],
      ),
    );
  }

  Widget _buildHorizontalShimmer() {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(right: 8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget({
    required String message,
    required VoidCallback onRetry,
  }) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.redAccent,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $message',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
