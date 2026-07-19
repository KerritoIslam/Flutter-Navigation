import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// --- Models ---
class Movie {
  final String id;
  final String title;
  final String genre;
  final String description;
  final double rating;

  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.description,
    required this.rating,
  });
}

final List<Movie> movies = [
  const Movie(
    id: '1',
    title: 'The Dark Knight',
    genre: 'Action',
    description: 'Batman faces the Joker, a criminal mastermind who plunges Gotham into anarchy.',
    rating: 9.0,
  ),
  const Movie(
    id: '2',
    title: 'Inception',
    genre: 'Sci-Fi',
    description: 'A thief who steals corporate secrets through dream-sharing technology.',
    rating: 8.8,
  ),
  const Movie(
    id: '3',
    title: 'Parasite',
    genre: 'Thriller',
    description: 'A poor family schemes to become employed by a wealthy family.',
    rating: 8.6,
  ),
  const Movie(
    id: '4',
    title: 'Interstellar',
    genre: 'Sci-Fi',
    description: 'A team of explorers travel through a wormhole in space.',
    rating: 8.7,
  ),
  const Movie(
    id: '5',
    title: 'The Shawshank Redemption',
    genre: 'Drama',
    description: 'Two imprisoned men bond over a number of years.',
    rating: 9.3,
  ),
];

// --- Router ---
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(
          path: '/movies',
          builder: (context, state) => const MoviesTab(),
          routes: [
            GoRoute(
              path: 'details/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                final movie = state.extra as Movie?;
                return MovieDetailsScreen(movieId: id, movie: movie);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesTab(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileTab(),
          routes: [
            GoRoute(
              path: 'settings',
              name: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

// --- App ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movie Explorer',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

// --- Splash ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie, size: 80, color: Colors.blue),
            SizedBox(height: 24),
            Text('Movie Explorer', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

// --- Login ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => context.go('/movies'),
          icon: const Icon(Icons.login),
          label: const Text('Log In'),
        ),
      ),
    );
  }
}

// --- Shell ---
class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/movies')) return 0;
    if (location.startsWith('/favorites')) return 1;
    if (location.startsWith('/profile')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex(context),
        onTap: (index) {
          switch (index) {
            case 0: context.go('/movies');
            case 1: context.go('/favorites');
            case 2: context.go('/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// --- Movies Tab ---
class MoviesTab extends StatelessWidget {
  const MoviesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(movie.id)),
              title: Text(movie.title),
              subtitle: Text('${movie.genre} - ${movie.rating}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/movies/details/${movie.id}', extra: movie);
              },
            ),
          );
        },
      ),
    );
  }
}

// --- Movie Details ---
class MovieDetailsScreen extends StatelessWidget {
  final String movieId;
  final Movie? movie;

  const MovieDetailsScreen({super.key, required this.movieId, this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie?.title ?? 'Movie $movieId')),
      body: movie != null
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.movie_creation, size: 80, color: Colors.blue),
                  ),
                  const SizedBox(height: 24),
                  Text(movie!.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('${movie!.genre} | ${movie!.rating}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 16),
                  Text(movie!.description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            )
          : Center(child: Text('Movie ID: $movieId')),
    );
  }
}

// --- Favorites Tab ---
class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: const Center(
        child: Text('No favorites yet', style: TextStyle(fontSize: 18, color: Colors.grey)),
      ),
    );
  }
}

// --- Profile Tab ---
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => context.pushNamed('settings'),
          icon: const Icon(Icons.settings),
          label: const Text('Settings'),
        ),
      ),
    );
  }
}

// --- Settings ---
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle dark theme'),
            value: false,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Enable push notifications'),
            value: true,
            onChanged: (val) {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            subtitle: const Text('Movie Explorer v1.0'),
          ),
        ],
      ),
    );
  }
}
