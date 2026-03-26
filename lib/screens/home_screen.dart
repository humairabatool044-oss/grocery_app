import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import '../widgets/promo_banner.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Vegetables", "image": "assets/images/veg.jpg"},
      {"title": "Fruits", "image": "assets/images/fruits.jpg"},
      {"title": "Coffee & Drinks", "image": "assets/images/coffee.jpg"},
    ];

    final products = [
      Product(
          name: "Fresh Carrot",
          image: "assets/images/carrot.jpg",
          price: 4.99),
      Product(
          name: "Boneless meat", image: "assets/images/meat.jpg", price: 4.99),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          "FreshMart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 2,
        actions: const [
          Icon(Icons.person),
          SizedBox(width: 10),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for groceries and more...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Promo Banner
            const PromoBanner(),
            const SizedBox(height: 16),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Categories",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CategoryItem(
                      image: cat["image"]!,
                      title: cat["title"]!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Popular Items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Popular Items",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final prod = products[index];
                  return ProductItem(
                    image: prod.image,
                    name: prod.name,
                    price: prod.price,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}