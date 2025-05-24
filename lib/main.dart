import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'business_logic/bloc/album_bloc.dart';
import 'data/datasources/api_service.dart';
import 'data/repositories/album_repository.dart';
import 'presentation/screens/album_list_screen.dart';
import 'presentation/screens/album_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final albumRepository = AlbumRepository(apiService: apiService);
    final albumBloc = AlbumBloc(repository: albumRepository);

    final router = GoRouter(
      initialLocation: '/',
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

    return BlocProvider(
      create: (context) => albumBloc..add(LoadAlbums()),
      child: MaterialApp.router(
        title: 'Album List',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF9C27B0), // Deep Purple
            brightness: Brightness.light,
            primary: const Color(0xFF9C27B0),
            secondary: const Color(0xFFE1BEE7),
            tertiary: const Color(0xFF7B1FA2),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xFF9C27B0),
            foregroundColor: Colors.white,
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          listTileTheme: const ListTileThemeData(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C27B0),
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
