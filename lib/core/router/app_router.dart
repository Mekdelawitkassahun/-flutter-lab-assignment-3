import 'package:go_router/go_router.dart';
import '../../presentation/screens/album_detail_screen.dart';
import '../../presentation/screens/album_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const AlbumListScreen(),
  routes: [
    GoRoute(
       path: '/',
      builder: (context, state) => const AlbumListScreen(),
    ),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) {
        final albumId = int.parse(state.pathParameters['id']!);
        final albumTitle = state.extra as String? ?? 'Album $albumId';
        return AlbumDetailScreen(
          albumId: albumId,
          albumTitle: albumTitle,
        );
      },
    ),
  ],
); 