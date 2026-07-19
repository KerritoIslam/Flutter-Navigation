import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}

final List<Product> products = [
  const Product(
    id: '1',
    name: 'Wireless Headphones',
    description: 'Premium noise-cancelling headphones with 30-hour battery life.',
    price: 299.99,
  ),
  const Product(
    id: '2',
    name: 'Smart Watch',
    description: 'Track your fitness, receive notifications, and more.',
    price: 199.99,
  ),
  const Product(
    id: '3',
    name: 'Laptop Stand',
    description: 'Ergonomic aluminum stand for better posture.',
    price: 49.99,
  ),
  const Product(
    id: '4',
    name: 'Mechanical Keyboard',
    description: 'RGB backlit with cherry MX switches.',
    price: 149.99,
  ),
];

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductListScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final product = state.extra as Product?;
        return ProductDetailsScreen(
          productId: id,
          product: product,
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Exercise 7 - Product List & Details',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(product.id),
              ),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/product/${product.id}', extra: product);
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  final Product? product;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product?.name ?? 'Product $productId'),
      ),
      body: product != null
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
                    child: const Icon(Icons.shopping_bag, size: 80, color: Colors.blue),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    product!.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product!.price}',
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product!.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          : Center(
              child: Text('Product ID: $productId'),
            ),
    );
  }
}
