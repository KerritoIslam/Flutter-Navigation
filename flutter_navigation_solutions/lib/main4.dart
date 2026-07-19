import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 4 - News Screen Tabs',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.sports), text: 'Sports'),
              Tab(icon: Icon(Icons.computer), text: 'Technology'),
              Tab(icon: Icon(Icons.business), text: 'Business'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryPage(
              category: 'Sports',
              icon: Icons.sports,
              articles: [
                'Team wins championship',
                'Player breaks record',
                'New season schedule released',
              ],
            ),
            CategoryPage(
              category: 'Technology',
              icon: Icons.computer,
              articles: [
                'New smartphone released',
                'AI breakthrough announced',
                'Tech stocks surge',
              ],
            ),
            CategoryPage(
              category: 'Business',
              icon: Icons.business,
              articles: [
                'Market hits all-time high',
                'Startup raises funding',
                'Global trade update',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String category;
  final IconData icon;
  final List<String> articles;

  const CategoryPage({
    super.key,
    required this.category,
    required this.icon,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Icon(icon, size: 64, color: Colors.blue),
        const SizedBox(height: 16),
        Text(
          '$category News',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...articles.map(
          (article) => Card(
            child: ListTile(
              leading: const Icon(Icons.article),
              title: Text(article),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ],
    );
  }
}
