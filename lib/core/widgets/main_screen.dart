import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/movies/ui/views/movies_view.dart';
import '../../features/tv_shows/ui/views/tv_shows_view.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);

final navigationPagesProvider = Provider<List<Widget>>(
  (ref) => [
    const MoviesView(),
    const TvShowsView(),
  ],
);

class MainNavigationView extends ConsumerWidget {
  static const String routeName = '/main';
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);
    final pages = ref.watch(navigationPagesProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref.read(navigationIndexProvider.notifier).state = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            enableFeedback: false,
            mouseCursor: SystemMouseCursors.basic,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: 'TV Shows',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
