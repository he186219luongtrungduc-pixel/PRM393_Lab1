import 'package:flutter/material.dart';

import '../widgets/product_list_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products"), centerTitle: true),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              decoration: InputDecoration(
                hintText: "Search products...",

                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          const Expanded(child: ProductListWidget()),
        ],
      ),

      // Phần dưới điện thoại
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),

            label: "Product Detail",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),

            label: "Cart",
          ),
        ],
      ),
    );
  }
}
