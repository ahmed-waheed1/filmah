import 'package:flutter/material.dart';

import '../../features/movies/ui/views/movie_details_view.dart';
import '../../features/movies/ui/views/movies_view.dart';
import '../../features/tv_shows/ui/views/tv_shows_view.dart';
import '../widgets/main_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _viewMaterialRoute(
          view: const MainNavigationView(),
        );
      case MainNavigationView.routeName:
        return _viewMaterialRoute(
          view: const MainNavigationView(),
        );
      case MoviesView.routeName:
        return _viewMaterialRoute(
          view: const MoviesView(),
        );
      case TvShowsView.routeName:
        return _viewMaterialRoute(
          view: const TvShowsView(),
        );
      case MovieDetailView.routeName:
        return _viewMaterialRoute(
          view: MovieDetailView(
            movieId: settings.arguments as int,
          ),
        );
      default:
        return null;
    }
  }

  static MaterialPageRoute<dynamic> _viewMaterialRoute({
    required Widget view,
    Object? arguments,
  }) {
    return MaterialPageRoute(
      builder: (context) => view,
      settings: RouteSettings(arguments: arguments),
    );
  }
}
