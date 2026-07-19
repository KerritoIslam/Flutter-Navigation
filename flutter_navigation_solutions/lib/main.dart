import 'package:flutter/material.dart';

import 'main1.dart' as ex1;
import 'main2.dart' as ex2;
import 'main3.dart' as ex3;
import 'main4.dart' as ex4;
import 'main5.dart' as ex5;
import 'main6.dart' as ex6;
import 'main7.dart' as ex7;
import 'main8.dart' as ex8;
import 'main9.dart' as ex9;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Solutions',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const SolutionSelector(),
    );
  }
}

class SolutionSelector extends StatelessWidget {
  const SolutionSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final solutions = [
      _Solution('1 - Two-Screen Navigation', const ex1.FirstScreen()),
      _Solution('2 - Simple Login Flow', const ex2.LoginPage()),
      _Solution('3 - Shopping App Tabs', const ex3.ShoppingAppShell()),
      _Solution('4 - News Screen Tabs', const ex4.NewsScreen()),
      _Solution('5 - Home & About (GoRouter)', const ex5.HomeScreen()),
      _Solution('6 - Splash, Login, Home Flow', const ex6.SplashScreen()),
      _Solution('7 - Product List & Details', const ex7.ProductListScreen()),
      _Solution('8 - ShellRoute Conversion', const ex8.HomeTab()),
      _Solution('9 - Movie Explorer (Final)', const ex9.SplashScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Navigation Solutions'),
      ),
      body: ListView.builder(
        itemCount: solutions.length,
        itemBuilder: (context, index) {
          final solution = solutions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                solution.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => solution.widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _Solution {
  final String title;
  final Widget widget;

  _Solution(this.title, this.widget);
}
